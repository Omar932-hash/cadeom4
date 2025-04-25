import 'package:flutter/material.dart';

class VoiceNotePage extends StatelessWidget {
  const VoiceNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page de Notes Vocales')),
      body: Center(
        child: Text(
          'Bienvenue sur la page des notes vocales.',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
