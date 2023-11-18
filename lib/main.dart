import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Note {
  String title;
  String content;

  Note({
    required this.title,
    required this.content,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NoteScreen(),
    );
  }
}

class NoteScreen extends StatefulWidget {
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  List<Note> notes = [];
  TextEditingController _titleController = TextEditingController();
  TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keep Notes App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Note Title',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _contentController,
              decoration: InputDecoration(
                labelText: 'Note Content',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_titleController.text.isNotEmpty &&
                  _contentController.text.isNotEmpty) {
                setState(() {
                  notes.add(
                    Note(
                      title: _titleController.text,
                      content: _contentController.text,
                    ),
                  );
                  _titleController.clear();
                  _contentController.clear();
                });
              }
            },
            child: Text('Add Note'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(notes[index].title),
                  subtitle: Text(notes[index].content),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        notes.removeAt(index);
                      });
                    },
                  ),
                  onTap: () {
                    // Add navigation to a note detail screen or editing screen
                    // and pass the selected note to edit
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
