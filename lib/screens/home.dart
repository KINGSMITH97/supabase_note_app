import 'package:flutter/material.dart';
import 'package:supabase_note_app/main.dart';
import 'package:supabase_note_app/model/note_item.dart';
import 'package:supabase_note_app/screens/create_note_page.dart';
import 'package:supabase_note_app/screens/update_note.dart';

import 'package:supabase_note_app/services/crud_operations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController noteContentController = TextEditingController();
  TextEditingController updateNoteController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        title: const Text('Supabase Notes App'),
        actions: [
          IconButton(
            onPressed: () {
              supabase.auth.signOut().then((value){
                
              });
            },
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreateNotePage(),
              ));
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: fetchNotes(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final notes = snapshot.data!;

          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final NoteItem note = NoteItem.fromJson(notes[index]);

              return Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateNotePage(note: note),
                        ));
                  },
                  onLongPress: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Delete Note'),
                          content: const Text(
                            'Are you sure you want to delete this note?',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                deleteNoteItem(context, note.id);
                              },
                              child: const Text(
                                'Delete',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.teal[100],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            note.title,
                            style: const TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            note.noteContent,
                            style: const TextStyle(
                              fontSize: 24,
                            ),
                          ),
                          const Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "Created on: ",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

//
}

void deleteNoteItem(BuildContext context, int noteId) {
  deleteNote(noteId);
  Navigator.pop(context);
}
