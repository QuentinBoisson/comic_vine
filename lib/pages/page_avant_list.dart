import 'package:flutter/material.dart';
import 'list.dart';

class PageAvantList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sélectionner une catégorie')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Liste(type: 'Comics')),
                );
              },
              child: Text('Comics'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Liste(type: 'Series')),
                );
              },
              child: Text('Series'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Liste(type: 'Films')),
                );
              },
              child: Text('Films'),
            ),
          ],
        ),
      ),
    );
  }
}
