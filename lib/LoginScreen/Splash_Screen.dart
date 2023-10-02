// @dart=2.9
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hdfc_ls/LoginScreen/Login_Screen.dart';
import 'package:hdfc_ls/StyleScreen/StyleScreen.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
            const Login_Screen()
            )
        )
    );
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Image.asset(
              "assets/SplashBackground.png",color: ColorName.buttoncolor,colorBlendMode: BlendMode.luminosity, filterQuality: FilterQuality.high,
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            Center(
              child: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      "assets/SplashScreen_Circle.png",
                      height: 150,
                      width: 150,
                    ),
                  ),
                  Center(
                    child: Image.asset("assets/Logo/logo.png",
                        height: 130, width: 130),
                  ),
                ],
                // child: Container(
                //   decoration: BoxDecoration(
                //     image: DecorationImage(image: AssetImage('assets/SplashScreen_Circle.png',),),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Image.asset("assets/Logo/logo.png",
                //         height: 80, width: 80),
                //   ),
                // ),
              ),
            )

          ],
        ),

      ),

    );
  }
}
