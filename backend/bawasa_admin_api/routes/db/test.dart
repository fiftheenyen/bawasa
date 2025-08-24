import 'package:bawasa_admin_api/services/db.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context) async {
  try {
    final conn = await Db.connection;
    final result = await conn.execute("SELECT 'Connected to MySQL' AS status;");
    return Response.json(
        body: {'status': result.rows.first.typedColAt<String>(0)});
  } catch (e) {
    return Response.json(body: {'error': e.toString()}, statusCode: 500);
  }
}
