import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {
  final String? noteID;
  const NoteModify({this.noteID});

  bool get isEditing => noteID != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? "Modifier la note": "creer la note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Title de note",
              ),
            ),
            Container(
              height: 7,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Contenu de la note",
              ),
            ),
            Container(
              height: 16,
            ),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                  color: Colors.blueGrey,
                  child: Text("Valider",
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
