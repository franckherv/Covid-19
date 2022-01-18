// import 'package:flutter/material.dart';

// // Define a custom Form widget.
// class MotifRefus extends StatefulWidget {
//   static const routeName = '/motifRefus';
//   const MotifRefus({Key? key}) : super(key: key);

//   @override
//   _MotifRefusState createState() => _MotifRefusState();
// }

// // Define a corresponding State class.
// // This class holds the data related to the Form.
// class _MotifRefusState extends State<MotifRefus> {
//   // Create a text controller and use it to retrieve the current value
//   // of the TextField.
//   final myController = TextEditingController();

//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     myController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue[900],
//         title: const Text(
//           'Motif du refus',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: TextField(
//           controller: myController,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         // When the user presses the button, show an alert dialog containing
//         // the text that the user has entered into the text field.
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 // Retrieve the text the that user has entered by using the
//                 // TextEditingController.
//                 content: Text(myController.text),
//               );
//             },
//           );
//         },
//         tooltip: 'Show me the value!',
//         child: const Text('Voir'),
//       ),
//     );
//   }
// }










// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

// Define a custom Form widget.

// class MotifRefus extends StatefulWidget {
//   static const routeName = '/motifRefus';
//   const MotifRefus({Key? key}) : super(key: key);

//   @override
//   _MotifRefusState createState() => _MotifRefusState();
// }

// // Define a corresponding State class.
// // This class holds the data related to the Form.
// class _MotifRefusState extends State<MotifRefus> {
//   // Create a text controller and use it to retrieve the current value
//   // of the TextField.
//   final myController = TextEditingController();

//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     myController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue[900],
//         title: const Text(
//           'Motif du refus',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: TextField(
//           controller: myController,
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         // When the user presses the button, show an alert dialog containing
//         // the text that the user has entered into the text field.
//         onPressed: () {
//           showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 // Retrieve the text the that user has entered by using the
//                 // TextEditingController.
//                 content: Text(myController.text),
//               );
//             },
//           );
//         },
//         tooltip: 'Show me the value!',
//         child: const Text('Voir'),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: '',
//       home: MotifRefus(),
//     );
//   }
// }

// class MotifRefus extends StatefulWidget {
//   static const routeName = '/motifRefus';
//   @override
//   _MotifRefusState createState() => _MotifRefusState();
// }

// class _MotifRefusState extends State<MotifRefus> {
//   final TextEditingController _controller = TextEditingController();
//   final _channel = WebSocketChannel.connect(
//     Uri.parse('wss://echo.websocket.org'),
//   );

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.blue[900],
//           title: Text(''),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Form(
//                 child: TextFormField(
//                   controller: _controller,
//                   decoration:
//                       const InputDecoration(labelText: 'Envoyer un motif'),
//                 ),
//               ),
//               const SizedBox(height: 24),
//               StreamBuilder(
//                 stream: _channel.stream,
//                 builder: (context, snapshot) {
//                   return Text(snapshot.hasData ? '${snapshot.data}' : '');
//                 },
//               )
//             ],
//           ),
//         ),
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: Colors.blue[900],
//           onPressed: _sendMotif,
//           tooltip: 'Send message',
//           child: const Icon(
//             Icons.send,
//           ), // This trailing comma makes auto-formatting nicer for build methods.
//         ));
//   }

//   void _sendMotif() {
//     if (_controller.text.isNotEmpty) {
//       _channel.sink.add(_controller.text);
//     }
//   }

//   @override
//   void dispose() {
//     _channel.sink.close();
//     super.dispose();
//   }
// }

class MotifRefus extends StatefulWidget {
  static const routeName = '/motifRefus';
  const MotifRefus({Key? key}) : super(key: key);

  @override
  _MotifRefusState createState() => _MotifRefusState();
}

class _MotifRefusState extends State<MotifRefus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        centerTitle: true,
      ),
      body: Container(
          child: ElevatedButton(
        child: Text('open Dialog'),
        onPressed: () {
          openDialog(context);
        },
      )),
    );
  }

  Future openDialog(context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Motif'),
            content: TextField(
              decoration:
                  InputDecoration(hintText: 'entrez le motif de votre refus'),
            ),
            actions: [TextButton(onPressed: () {}, child: Text('SOUMETTRE'))],
          ));
}