class AuthService {
  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2)); // Simulate API
    return email == 'admin@bawasa.com' && password == '123456';
  }
}
