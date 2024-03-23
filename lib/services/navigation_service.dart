import 'package:flutter/material.dart';
import 'package:supabase_note_app/index_page.dart';
import 'package:supabase_note_app/screens/home.dart';
import 'package:supabase_note_app/screens/login.dart';
import 'package:supabase_note_app/screens/signup.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static const String index = "/";
  static const String login = "/login";
  static const String signUp = "/sign-up";
  static const String home = "/home";

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case index:
        return openRoute(const IndexPage());
      case login:
        return openRoute(const LoginPage());
      case signUp:
        return openRoute(const SignupPage());
      case home:
        return openRoute(const HomePage());
      default:
        return openRoute(const ErrorPage());
    }
  }

  static MaterialPageRoute openRoute(Widget page) {
    return MaterialPageRoute(
      builder: (context) => page,
    );
  }

  static navigateTo({
    required String pageName,
    bool? clearStack,
    bool? replacePreviousPage,
  }) {
    if (clearStack == true) {
      navigatorKey.currentState
          ?.pushNamedAndRemoveUntil(pageName, (route) => true);
      return;
    }

    if (replacePreviousPage == true) {
      navigatorKey.currentState?.pushReplacementNamed(pageName);
      return;
    }

    navigatorKey.currentState?.pushNamed(pageName);
    return;
  }

  static openHomePage({bool? clearStack}) {
    navigateTo(pageName: home, clearStack: clearStack);
  }

  static openSignUpPage(){
    navigateTo(pageName: signUp);
  }
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("This page does not exist yet"),
      ),
    );
  }
}
