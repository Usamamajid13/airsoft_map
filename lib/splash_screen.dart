import 'dart:async';
import 'package:flutter/material.dart';
import 'constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    splashNavigator();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff010008),
        body: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset("assets/logo.png",scale: 10,),
          ),
        ));
  }

  splashNavigator() {
    Timer(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, categorySelectionScreenRoute);
    });
  }
}