import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabase_note_app/main.dart';

//
Future<void> createNote(String noteContent, String noteTitle) async {
  await supabase.from('notes').insert({
    'note_content': noteContent,
    'note_title': noteTitle,
  });
}

// Future<void> fetchNotes() async {
//   final userId = supabase.auth.currentUser!.id;
//   await supabase.from('notes').select().eq('user_id', userId);
// }

//
Future<void> createUser(String userEmail) async {
  await supabase.from('users').insert({
    'user_email': userEmail,
  });
}

//
Future<void> updateNote(
    String noteContent, String noteTitle, int noteId) async {
  await supabase.from('notes').update(
      {'note_content': noteContent, 'note_title': noteTitle}).eq('id', noteId);
}

//
Future<void> deleteNote(int noteId) async {
  await supabase.from('notes').delete().eq('id', noteId);
}

SupabaseStreamBuilder fetchNotes() {
  String userId = supabase.auth.currentUser?.id ?? "";
  return supabase
      .from('notes')
      .stream(primaryKey: ['id']).eq("user_id", userId);
}
