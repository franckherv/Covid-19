import 'package:flutter/material.dart';

class NoteDelete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
    title: Text("Attention"),
    content: Text("Voulez-vous vraiment supprimer cette note?"),
    actions: [
     TextButton(onPressed: () => Navigator.of(context).pop(true), child: Text("Oui")),
     TextButton(onPressed: () => Navigator.of(context).pop(false), child: Text("Non")),
    ],
  );;
  }
}