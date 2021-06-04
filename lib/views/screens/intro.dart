import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

//screens
import 'auth/login_screen.dart';
import 'auth/register_screen.dart';

class Intro extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context,snapshot){
        if (snapshot.hasError){
          print(snapshot);
          return Scaffold(
            body: Center(
              child: Text("$Error ocurred while trying to connect to our servers")
            )
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return LogInMiddleware();
        }
        
        return Scaffold(
            body:Center(
              child: Text("Please wait while we connect you to our servers q:^p"),
            )
          );
      },
    
    );
  }
}


class LogInMiddleware extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,

        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("EBERS LOGO"),
            //SVGPICTUREASSET
            SizedBox(height: size.height * 0.50),
            RoundedButton(
              text:"Register",
              press:(){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return Register();
                    },
                  ),
                );
              },
              color: Colors.deepPurpleAccent,
              textColor: Colors.white60
            ),
            RoundedButton(
              text:"Log In",
              press:(){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LogIn ();
                    },
                  ),
                );
              },
              color: Colors.deepPurpleAccent,
              textColor: Colors.white60
            )
          ],
        )
      ),
    );
  }
}

class RoundedButton extends StatelessWidget{
  final String text;
  final Function press;
  final Color color,textColor;

  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color,
    this.textColor
  }) : super(key:key);

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Container(
      width: size.width*0.7,
      child:ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(this.color),
          foregroundColor: MaterialStateProperty.all<Color>(this.textColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: this.color)
              )
          )
        ),
        child: Text(this.text),
        onPressed: this.press,
      ),
    );
  }
}
