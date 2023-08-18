import 'dart:async';
import 'package:flutter/material.dart';
import 'package:untitled1/screens/onboarding_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen ({Key? key}) : super(key: key);

  @override
  splashScreenState createState() => splashScreenState();
}

class splashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds:3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFEF9A9A),
                Color(0xFFB444DB),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('welcome',style: TextStyle(color: Colors.white,fontSize: 60),),
              SizedBox(height: 20,),
              CircularProgressIndicator(color: Colors.red[200],),

            ],
          ),
        ),
      ),
    );
  }
}