import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:supabase_note_app/model/note_item.dart';
import 'package:supabase_note_app/services/crud_operations.dart';

class UpdateNotePage extends StatefulWidget {
  const UpdateNotePage({super.key, required this.note});
  final NoteItem note;

  @override
  State<UpdateNotePage> createState() => _UpdateNotePageState();
}

class _UpdateNotePageState extends State<UpdateNotePage> {
  String? updatedNote;
  String? updatedTitle;
  final lastEditDate = DateFormat('y-M-d').format(DateTime.now());
  final lastEditTime = DateFormat('jm').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('update note'),
        actions: [
          IconButton(
            onPressed: () async {
              updateNote(
                updatedNote ?? widget.note.noteContent,
                updatedTitle ?? widget.note.title,
                widget.note.id,
              );
              Navigator.pop(context);
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
                style: const TextStyle(
                  fontSize: 24,
                  letterSpacing: 0,
                ),
                initialValue: widget.note.title,
                onChanged: (value) {
                  setState(() {
                    updatedTitle = value;
                  });
                },
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
                maxLines: null,
                style: const TextStyle(
                  fontSize: 18,
                  letterSpacing: 0,
                ),
                initialValue: widget.note.noteContent,
                onChanged: (value) {
                  setState(() {
                    updatedNote = value;
                  });
                },
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
