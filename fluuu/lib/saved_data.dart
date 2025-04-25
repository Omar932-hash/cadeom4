import 'package:flutter/material.dart';

class SavedData extends StatelessWidget {
  const SavedData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Note')),
      body: Center(
        child: Text(
          'Ceci est une note sauvegardée.',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
