import 'package:flutter/material.dart';
import 'package:supabase_note_app/main.dart';
import 'package:supabase_note_app/screens/home.dart';
import 'package:supabase_note_app/screens/signup.dart';
import 'package:supabase_note_app/screens/splash_screen.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: startApp(),
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return const SplashScreen();
        }

        return supabase.auth.currentUser == null
            ? const SignupPage()
            : const HomePage();
      },
    );
  }

  Future<bool> startApp() async {
    return Future.delayed(
      const Duration(seconds: 3),
      () => true,
    );
  }
}
