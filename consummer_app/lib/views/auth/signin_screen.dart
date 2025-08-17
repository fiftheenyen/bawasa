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

  TextEditingController? get _passwordController => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          SizingConfig.init(constraints);
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: SizingConfig.widthMultiplier * 5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: SizingConfig.heightMultiplier * 16),
                Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: SizingConfig.textMultiplier * 4,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: SizingConfig.heightMultiplier * 8),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter Email',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: SizingConfig.heightMultiplier * 2),
                TextField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Password',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      focusNode: FocusNode(
                        skipTraversal: true,
                      ), // 👈 Keeps cursor in the field
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
                SizedBox(height: SizingConfig.heightMultiplier * 7),
                SizedBox(
                  width: double.infinity,
                  height: SizingConfig.heightMultiplier * 6,
                  child: ElevatedButton(
                    onPressed: () {
                      // TODO: Add sign-in logic
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1D4ED8),
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: SizingConfig.textMultiplier * 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
