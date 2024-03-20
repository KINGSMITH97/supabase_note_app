import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_note_app/main.dart';

class Authentication {
  //
  Future<void> signup(
      {required String email,
      required String password,
      required Map<String, dynamic> data}) async {
    //
    try {
      //
      await supabase.auth.signUp(password: password, email: email, data: data);

      //
    } on AuthException catch (e) {
      //
      print(e);
    }
  }

  Future<void> login({required String email, required String password}) async {
    //
    try {
      //
      await supabase.auth.signInWithPassword(password: password, email: email);

      //
    } on AuthException catch (e) {
      //
      print(e);
    }
  }
}
