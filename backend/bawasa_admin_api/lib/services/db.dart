import 'package:mysql_client/mysql_client.dart';
import 'package:dotenv/dotenv.dart';

class Db {
  static MySQLConnection? _connection;

  static Future<MySQLConnection> get connection async {
    if (_connection != null && _connection!.connected) return _connection!;

    final env = DotEnv()..load();

    _connection = await MySQLConnection.createConnection(
      host: env['DB_HOST'] ?? 'localhost',
      port: int.parse(env['DB_PORT'] ?? '3306'),
      userName: env['DB_USER'] ?? 'root',
      password: env['DB_PASS'] ?? '',
      databaseName: env['DB_NAME'] ?? 'bawasa',
    );

    await _connection!.connect();
    return _connection!;
  }
}
