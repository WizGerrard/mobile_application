import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  // API endpoint for sign-in
  static const String apiUrl = 'https://yourapi.com/signin';

  // TextEditingController for email and password fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signIn(BuildContext context) async {
    // Validate email and password
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      // Show error if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    try {
      // Make POST request to signin API
      final response = await http.post(Uri.parse(apiUrl), body: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        // Successful signin
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Signin successful')),
        );
        // Navigate to another screen or perform desired action
      } else {
        // Handle other status codes (e.g., 401 for unauthorized, 404 for not found)
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Signin failed: ${response.body}')),
        );
      }
    } catch (e) {
      // Handle network errors or other exceptions
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Error signing in. Please try again later.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Sign In',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => signIn(context),
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
