import 'package:flutter/material.dart';
import 'package:sushi/domain/models/user.dart';
import 'package:sushi/repo/repository.dart';
import 'package:sushi/views/screens/tabs.screen.dart';

class AuthForm extends StatefulWidget {
  final bool isSignUp;

  const AuthForm({required this.isSignUp, super.key});

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Repository _repository = Repository();
  bool _isLoading = false;

  void _signUp() async {
    setState(() {
      _isLoading = true;
    });
    try {
      User user = User(
        username: _usernameController.text,
        password: _passwordController.text,
        email: _emailController.text,
      );
      String token = await _repository.signUp(user);
      print('Sign up successful. Token: $token');
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TabsScreen()),
      );
    } catch (e) {
      print('Error during sign up: $e');
      // Show error message to the user
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  void _signIn() async {
    setState(() {
      _isLoading = true;
    });
    try {
      String token = await _repository.signIn(
        _emailController.text,
        _passwordController.text,
      );
      print('Sign in successful. Token: $token');
      if (!mounted) return;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TabsScreen()),
      );
    } catch (e) {
      print('Error during sign in: $e');
      // Show error message to the user
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.isSignUp)
          TextField(
            controller: _emailController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person),
              labelText: 'Email',
              hintText: 'demo@email.com',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
        if (widget.isSignUp) const SizedBox(height: 20),
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.email),
            labelText: 'Username',
            hintText: 'Enter your username',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        const SizedBox(height: 20),
        TextField(
          controller: _passwordController,
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.lock),
            labelText: 'Password',
            hintText: '********',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        const SizedBox(height: 10),
        if (!widget.isSignUp)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: false, // Add a controller to manage state
                    onChanged: (bool? value) {
                      // Handle checkbox state change
                    },
                  ),
                  const Text('Remember Me'),
                ],
              ),
              TextButton(
                onPressed: () {
                  // Handle forgot password
                },
                child: const Text('Forgot Password?'),
              ),
            ],
          ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          height: 60,
          child: ElevatedButton(
            onPressed: () {
              if (widget.isSignUp) {
                _signUp();
              } else {
                _signIn();
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange, // Button color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
            child: _isLoading
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  )
                : Text(
                    widget.isSignUp ? 'Sign up' : 'Login',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
