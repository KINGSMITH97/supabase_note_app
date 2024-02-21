import 'package:supabase_note_app/main.dart';

class CrudOperations {
//
  Future<void> createNote(String noteContent) async {
    await supabase.from('notes').insert({'note_content': noteContent});
  }

  //
  Future<void> updateNote(String noteContent, int noteId) async {
    await supabase
        .from('notes')
        .update({'note_content': noteContent}).eq('id', noteId);
  }

  //
  Future<void> deleteNote(int noteId) async {
    await supabase.from('notes').delete().eq('id', noteId);
  }
}
