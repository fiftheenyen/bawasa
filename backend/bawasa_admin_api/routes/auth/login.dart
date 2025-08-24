import 'dart:convert';
import 'package:dart_frog/dart_frog.dart';
import 'package:bawasa_admin_api/services/db.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:bcrypt/bcrypt.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response.json(
      statusCode: 405,
      body: {'error': 'Method not allowed. Use POST.'},
    );
  }

  try {
    // Parse request body
    final body = jsonDecode(await context.request.body());
    final username = body['username']?.toString().trim();
    final password = body['password']?.toString();

    if (username == null || password == null) {
      return Response.json(
        statusCode: 400,
        body: {'error': 'Username and password are required.'},
      );
    }

    // Query the database for the user
    final conn = await Db.connection;
    final results = await conn.execute(
      'SELECT id, username, password_hash, role FROM users WHERE username = :username LIMIT 1',
      {'username': username},
    );

    if (results.isEmpty) {
      return Response.json(
        statusCode: 401,
        body: {'error': 'Invalid username or password.'},
      );
    }

    final row = results.rows.first;
    final storedHash = row.colByName('password_hash')!;
    final role = row.colByName('role')!;

    // Verify password
    if (!BCrypt.checkpw(password, storedHash)) {
      return Response.json(
        statusCode: 401,
        body: {'error': 'Invalid username or password.'},
      );
    }

    // Create JWT
    final jwt = JWT(
      {
        'id': row.colByName('id'),
        'username': username,
        'role': role,
      },
      issuer: 'bawasa_backend',
    );

    final token = jwt.sign(SecretKey('your_jwt_secret_here'));

    return Response.json(body: {
      'token': token,
      'user': {
        'id': row.colByName('id'),
        'username': username,
        'role': role,
      }
    });
  } catch (e) {
    return Response.json(
      statusCode: 500,
      body: {'error': 'Server error', 'details': e.toString()},
    );
  }
}
