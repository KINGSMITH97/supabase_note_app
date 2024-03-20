class NoteItem {
  final int id;
  final String title;
  final String noteContent;
  NoteItem({required this.id, required this.title, required this.noteContent});

  factory NoteItem.fromJson(Map<String, dynamic> json) {
    return NoteItem(
      id: json['id'],
      title: json['note_title'],
      noteContent: json['note_content'],
    );
  }
}
