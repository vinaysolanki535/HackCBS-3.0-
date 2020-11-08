import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:hackcbs_farming_app/database/auth.dart';
import 'package:progress_indicators/progress_indicators.dart';


import 'login.dart';
import 'main_screen.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getUserId();

    Future.delayed(
      Duration(seconds: 3),
      () {
        if (userId != null && userId.isNotEmpty) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MainScreen(),
              ));
        }

        else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ));
        }
      },
    );
    Timer(Duration(seconds: 10), () {
      print("Yeah, this line is printed after 3 seconds");
    });
  }

  String userId ='';


  getUserId() async {
    await AuthService.getUserIdSharedPref().then((value) {
      setState(() {
        userId = value;
      });
    });



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/upperd@3x.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/logo.png'),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Kr',
                  style: TextStyle(
                    fontFamily: 'sf_pro_semibold',
                    fontSize: 40,
                    color: const Color(0xff1b262c),
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 40,
                  child: Image(
                    image: AssetImage('assets/sprout.png'),
                  ),
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  'shak',
                  style: TextStyle(
                    fontFamily: 'sf_pro_semibold',
                    fontSize: 40,
                    color: const Color(0xff1b262c),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'किसान की उन्नति है, देश की प्रगति',
              style: TextStyle(
                fontSize: 20,
                color: const Color(0xff1b262c),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            JumpingDotsProgressIndicator(
              fontSize: 50.0,
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  height: 170,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/lowerd@3x.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
