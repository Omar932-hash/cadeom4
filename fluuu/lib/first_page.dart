import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstNotePage extends StatefulWidget {
  const FirstNotePage({super.key});

  @override
  _FirstNotePageState createState() => _FirstNotePageState();
}

class _FirstNotePageState extends State<FirstNotePage> {
  final TextEditingController _controller = TextEditingController();

  void _saveNote() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> notes = prefs.getStringList('notes') ?? [];
    notes.add(_controller.text);
    await prefs.setStringList('notes', notes);
    _controller.clear();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Écrivez votre note'),
        actions: [IconButton(icon: Icon(Icons.save), onPressed: _saveNote)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextField(
            controller: _controller,
            maxLines: null, // Permet plusieurs lignes
            style: TextStyle(fontSize: 18), // Taille de police
            decoration: InputDecoration(
              hintText: 'Écrivez votre note ici...',
              border: InputBorder.none, // Supprime la bordure par défaut
              contentPadding: EdgeInsets.all(16.0), // Espacement interne
            ),
          ),
        ),
      ),
    );
  }
}
