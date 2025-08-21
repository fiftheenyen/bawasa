import 'package:bcrypt/bcrypt.dart';

void main() {
  const password = 'Admin@123';

  // Generate salt with 12 rounds
  final salt = BCrypt.gensalt(logRounds: 12);

  // Hash the password using the salt
  final hash = BCrypt.hashpw(password, salt);

  print('Hashed password: $hash');
}
