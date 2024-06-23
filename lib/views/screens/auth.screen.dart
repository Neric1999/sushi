import 'package:flutter/material.dart';
import 'package:sushi/views/widgets/auth.form.widget.dart';
import 'package:sushi/views/widgets/wave.painter.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isSignUp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            size: const Size(double.infinity, 600), // Adjust height as needed
            painter: WavePainter(),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 300),
                  Center(
                    child: Text(
                      isSignUp ? 'Sign up' : 'Sign in',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  AuthForm(isSignUp: isSignUp),
                  const SizedBox(height: 20),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(isSignUp
                            ? "Already have an account?"
                            : "Don't have an Account ?"),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isSignUp = !isSignUp;
                            });
                          },
                          child: Text(
                            isSignUp ? 'Sign in' : 'Sign up',
                            style: const TextStyle(
                              color: Colors.deepOrange,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
