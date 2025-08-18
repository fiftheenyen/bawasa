import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:consummer_app/core/routes/app_routes.dart';
import 'package:consummer_app/core/services/auth_service.dart';

class SizingConfig {
  static late double textMultiplier;
  static late double heightMultiplier;
  static late double widthMultiplier;

  static void init(BoxConstraints constraints) {
    heightMultiplier = constraints.maxHeight / 100;
    widthMultiplier = constraints.maxWidth / 100;
    textMultiplier = heightMultiplier;
  }
}

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final _authService = AuthService();

  bool _obscurePassword = true;

  Future<void> _onLoginPressed() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter both email and password')),
      );
      return;
    }

    setState(() => _isLoading = true);

    try {
      final success = await _authService.login(email, password);

      if (!mounted) return;
      setState(() => _isLoading = false);

      if (success) {
        context.go(AppRoutes.dashboard); // role‑based nav stays possible here
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Invalid credentials')));
      }
    } catch (e) {
      if (!mounted) return;
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Login failed: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            SizingConfig.init(constraints);

            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizingConfig.widthMultiplier * 6,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: SizingConfig.heightMultiplier * 10),

                  // Title
                  Text(
                    'Sign In',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontSize: SizingConfig.textMultiplier * 4.5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: SizingConfig.heightMultiplier * 5),

                  // Email Field
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontSize: SizingConfig.textMultiplier * 2,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          SizingConfig.widthMultiplier * 2,
                        ),
                      ),
                      contentPadding: EdgeInsets.all(
                        SizingConfig.widthMultiplier * 4,
                      ),
                    ),
                  ),

                  SizedBox(height: SizingConfig.heightMultiplier * 4),

                  // Password Field with Eye Icon
                  TextField(
                    obscureText: _obscurePassword,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontSize: SizingConfig.textMultiplier * 2,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          SizingConfig.widthMultiplier * 2,
                        ),
                      ),
                      contentPadding: EdgeInsets.all(
                        SizingConfig.widthMultiplier * 4,
                      ),
                      suffixIcon: IconButton(
                        focusNode: FocusNode(skipTraversal: true),
                        icon: Icon(
                          _obscurePassword
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                      ),
                    ),
                  ),

                  SizedBox(height: SizingConfig.heightMultiplier * 4),

                  // Sign In Button — always blue
                  SizedBox(
                    width: double.infinity,
                    height: SizingConfig.heightMultiplier * 6,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1D4ED8),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            SizingConfig.widthMultiplier * 2,
                          ),
                        ),
                      ),
                      onPressed: _onLoginPressed,
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: SizingConfig.textMultiplier * 2.2,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),

                  SizedBox(height: SizingConfig.heightMultiplier * 2),

                  // Forgot Password
                  TextButton(
                    onPressed: () {
                      debugPrint('Forgot password clicked');
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: SizingConfig.textMultiplier * 1.8,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
