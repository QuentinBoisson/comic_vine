import 'package:flutter/material.dart';

class PageApresList extends StatelessWidget {
  final String title;

  PageApresList({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Détails')),
      body: Center(
        child: Text(
          'Titre sélectionné : $title',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
