import 'package:flutter/material.dart';
import 'package:supabase_note_app/components/text_form_field.dart';
import 'package:supabase_note_app/screens/home.dart';

import 'package:supabase_note_app/services/authentication.dart';
import 'package:supabase_note_app/services/navigation_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Login to your account',
              style: TextStyle(
                fontSize: 28,
                letterSpacing: 0,
                fontWeight: FontWeight.w500,
                color: Colors.black45,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Email',
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            KtextFormField(
              controller: emailController,
              prefixIcon: const Icon(Icons.mail),
            ),
            const SizedBox(height: 16),
            const Text(
              'Password',
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 0,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 8),
            KtextFormField(
              obscureText: true,
              controller: passwordController,
              prefixIcon: const Icon(Icons.lock),
            ),
            const SizedBox(height: 32),
            SizedBox(
              height: 60,
              width: double.infinity,
              child: FilledButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Authentication().login(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );

                  if (!mounted) return;

                  NavigationService.openHomePage(clearStack: true);
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const HomePage(),
                  //   ),
                  // );
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
