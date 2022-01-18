import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tim_app_build/pages/firstPage.dart';

// class MyApp extends StatelessWidget {
// @override
// Widget build(BuildContext context) {
// 	return MaterialApp(
// 	title: 'Splash Screen',
// 	theme: ThemeData(
// 		primarySwatch: Colors.green,
// 	),
// 	home: MyHomePage(),
// 	debugShowCheckedModeBanner: false,
// 	);
// }
// }

class SplashPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => FirstPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Image(
          image: AssetImage('images/logobillsoft.png'),
        ));
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GeeksForGeeks")),
      body: Center(
          child: Text(
        "Home page",
        textScaleFactor: 2,
      )),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:splashscreen/splashscreen.dart';

// class SplashScreen extends StatelessWidget {
//   Color loaderColor;
//   int seconds;
//   double photoSize;
//   //dynamic onClick;
//   dynamic navigateAfterSeconds;
//   Text title;
//   //Color backgroundColor;
//   //TextStyle styleTextUnderTheLoader;
//   Image image;
//   Text loadingText;
//   //ImageProvider<dynamic> imageBackground;
//   //Gradient gradientBackground;

//   SplashScreen(
//       this.loaderColor,
//       this.seconds,
//       this.photoSize,
//     //  this.onClick,
//       this.navigateAfterSeconds,
//       this.title,
//      // this.backgroundColor,
//      // this.styleTextUnderTheLoader,
//       this.image,
//       this.loadingText,
//       //this.imageBackground,
//      // this.gradientBackground
      
//     );

//   @override
//   Widget build(BuildContext context) {
//     return SplashScreen(
//       	loaderColor: Colors.blue,
//   seconds: 6,
//   	photoSize: 100.0,
// 	navigateAfterSeconds: new SecondScreen(),
// 	title: new Text('GeeksForGeeks',textScaleFactor: 2,),
// 	image: new Image.network('https://www.geeksforgeeks.org/wp-content/uploads/gfg_200X200.png'),
// 	loadingText: Text("Loading"),


//     );
//   }

 





// class Splash2 extends StatelessWidget {
// @override
// Widget build(BuildContext context) {
// 	return SplashScreen(

// 	);
// }
// }
// class SecondScreen extends StatelessWidget {
// @override
// Widget build(BuildContext context) {
// 	return Scaffold(
// 	appBar: AppBar(title:Text("GeeksForGeeks")),
// 	body: Center(
// 		child:Text("Home page",textScaleFactor: 2,)
// 	),
// 	);
// }
// }
