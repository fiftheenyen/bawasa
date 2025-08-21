import 'package:dotenv/dotenv.dart';
import 'package:postgres/postgres.dart';

class Db {
  static PostgreSQLConnection? _connection;

  static Future<PostgreSQLConnection> get connection async {
    if (_connection != null && _connection!.isOpen) return _connection!;

    final env = DotEnv()..load();

    final conn = PostgreSQLConnection(
      env['DATABASE_HOST']!,
      int.parse(env['DATABASE_PORT']!),
      env['DATABASE_NAME']!,
      username: env['DATABASE_USER']!,
      password: env['DATABASE_PASSWORD']!,
    );

    await conn.open();
    _connection = conn;
    return conn;
  }
}
