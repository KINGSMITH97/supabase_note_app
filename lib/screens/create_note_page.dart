import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:supabase_note_app/services/crud_operations.dart';

class CreateNotePage extends StatefulWidget {
  const CreateNotePage({super.key});

  @override
  State<CreateNotePage> createState() => _CreateNotePageState();
}

class _CreateNotePageState extends State<CreateNotePage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final lastEditDate = DateFormat('y-M-d').format(DateTime.now());
  final lastEditTime = DateFormat('jm').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a new note'),
        actions: [
          IconButton(
            onPressed: () async {
              if (noteController.text.isEmpty) {
                return;
              } else {
                createNote(
                  noteController.text,
                  titleController.text,
                );
                Navigator.pop(context);
              }
            },
            icon: const Icon(
              Icons.upload,
              size: 32,
              color: Colors.green,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.pallet,
              size: 32,
              color: Colors.yellow[800],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'last edit on: $lastEditDate $lastEditTime',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: TextFormField(
                controller: titleController,
                style: const TextStyle(
                  fontSize: 24,
                  letterSpacing: 0,
                ),
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  label: Text(
                    'Title',
                    style: TextStyle(
                      fontSize: 24,
                      letterSpacing: 0,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: TextFormField(
                controller: noteController,
                maxLines: null,
                style: const TextStyle(
                  fontSize: 18,
                  letterSpacing: 0,
                ),
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                  ),
                  label: Text(
                    'notes',
                    style: TextStyle(
                      letterSpacing: 0,
                      fontSize: 18,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
