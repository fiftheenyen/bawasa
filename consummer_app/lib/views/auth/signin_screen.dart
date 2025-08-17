import 'package:flutter/material.dart';

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
  bool _obscurePassword = true;

  void _onLoginPressed() {
    // TODO: Add authentication logic here
    debugPrint('Login button pressed');
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
                      child: Text(
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
