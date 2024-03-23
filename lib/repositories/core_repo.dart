import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_note_app/main.dart';

class CoreRepo{
  final supabaseAuth = supabase.auth;
  final notesTable = supabase.from("notes");
  final usersTable = supabase.from("users");

  final User? currentUser = supabase.auth.currentUser;

  Stream<AuthState> authChanges(){
    return supabase.auth.onAuthStateChange;
  }
}

enum RepoResponseStatus {success, error, unknown}

class RepoResponse{
  dynamic data;
  RepoResponseStatus responseStatus;

  RepoResponse({this.data, required this.responseStatus});
}