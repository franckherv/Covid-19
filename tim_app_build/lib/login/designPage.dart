
import 'package:flutter/material.dart';
import 'package:tim_app_build/login/formulaireConnexion.dart';

class DesignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Stack(
          children: [
            Opacity(
              opacity: 0.5,
              child: ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  color: Colors.blue[900],
                  height: 120,
                ),
              ),
            ),
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                color: Colors.blue[900],
                height: 100,
              ),
            ),
          ],
        ),
        Text(" Bienvenue sur",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
        SizedBox(
          height: 20,
        ),
        Container(
            height: MediaQuery.of(context).size.height / 10,
            width: MediaQuery.of(context).size.width / 2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('images/logobillsoft.png'),
                    fit: BoxFit.cover))),
        SizedBox(
          height: 20,
        ),
        Divider(
          thickness: 2,
          indent: 40,
          endIndent: 40,
        ),
        FormValidation(),
      ]),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    throw UnimplementedError();
  }

  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, size.height);
    var firstStart = Offset(size.width / 5, size.height);
    var firstEnd = Offset(size.width / 2.25, size.height - 50.0);
    path.quadraticBezierTo(
        firstStart.dx, firstStart.dy, firstEnd.dx, firstEnd.dy);

    var secondStart =
        Offset(size.width - (size.width / 3.24), size.height - 105);
    var secondEnd = Offset(size.width, size.height - 10);
    path.quadraticBezierTo(
        secondStart.dx, secondStart.dy, secondEnd.dx, secondEnd.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
}
