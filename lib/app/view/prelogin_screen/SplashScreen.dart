import 'dart:async';

import 'package:e_commerce_dashboard/app/utils/Utils.dart';
import 'package:e_commerce_dashboard/app/view/Dashboard.dart';
import 'package:e_commerce_dashboard/app/view/prelogin_screen/IntroductionScreen.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      startTime();
  }

  startTime() async {
    var duration = new Duration(seconds: 2);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) => Dashboard()
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient:LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  hexToColor("#6ae7a7"),
                  hexToColor("#15bf9e"),

                ]
            )
        ),
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

                  Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 10), // changes position of shadow
                        ),
                      ],



                    ),
                      child: CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 74.0,
                        child: Image.asset("assets/images/app_icon.png",width: 120,),

                      ),

                  ),


              SizedBox(height: 20,),
              Text("e-Commerce Demo",
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
              Text("Appkode Pvt. Ltd.",
                style: TextStyle(fontSize: 12,fontWeight: FontWeight.w200),)
            ],
          ),
        ),
      ),
    );

  }
}
