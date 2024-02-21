import 'package:flutter/material.dart';
import 'package:supabase_note_app/main.dart';
import 'package:supabase_note_app/services/crud_operations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final noteStream = supabase.from('notes').stream(primaryKey: ['id']);
  TextEditingController noteContentController = TextEditingController();
  TextEditingController updateNoteController = TextEditingController();

  String updatedNote = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        title: const Text('Supabase Notes App'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Create a new note'),
                content: TextFormField(
                  controller: noteContentController,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[500],
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      CrudOperations().createNote(noteContentController.text);
                      noteContentController.clear();
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: noteStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          final notes = snapshot.data!;

          return ListView.builder(
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              final noteId = note['id'];
              return Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ListTile(
                  tileColor: Colors.grey[100],
                  title: Text(
                    note['note_content'].toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      letterSpacing: 0,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Update note'),
                                content: TextFormField(
                                  initialValue: note['note_content'],
                                  onChanged: (value) {
                                    setState(() {
                                      updatedNote = value;
                                    });
                                  },
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      CrudOperations()
                                          .updateNote(updatedNote, noteId);
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      'Save',
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () async {
                          bool isDeleteConfrimed = await showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Delete note'),
                                content: const Text(
                                  'Are you sure you want to delete this note',
                                  style: TextStyle(
                                    fontSize: 18,
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () async {
                                      return Navigator.pop(context, true);
                                    },
                                    child: const Text(
                                      'Yes',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      return Navigator.pop(context, false);
                                    },
                                    child: const Text(
                                      'No',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                          if (isDeleteConfrimed) {
                            CrudOperations().deleteNote(noteId);
                          }
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
