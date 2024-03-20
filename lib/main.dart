import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_note_app/screens/signup.dart';
import 'package:supabase_note_app/utils/app_theme.dart';

Future<void> main() async {
  //
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://jcadwrnheurdwieluofx.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpjYWR3cm5oZXVyZHdpZWx1b2Z4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDg1MDA4NzEsImV4cCI6MjAyNDA3Njg3MX0.aga1pdhnQYG4YLY0lUjO4231f1J4uDc5rn_7BsXZjxY',
  );

  //
  runApp(const MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appTheme,
      home: const SignupPage(),
    );
  }
}
