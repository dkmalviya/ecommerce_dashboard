import 'package:e_commerce_dashboard/app/utils/Utils.dart';
import 'package:e_commerce_dashboard/app/widgets/MyAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar("Profile", false, 0),
      body: Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40,),
            Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: 70,
                  child: ClipOval(child: Image.asset('assets/images/deep.jpeg', height: 150, width: 150, fit: BoxFit.cover,),),
                ),
                Positioned(bottom: 1, right: 1 ,child: Container(
                  height: 40, width: 40,
                  child: Icon(Icons.add_a_photo, color: Colors.white,),
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                ))
              ],
            ),

            SizedBox(height: 40,),

            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 20,left: 20,right: 20),
                decoration: BoxDecoration(
                    gradient: linearGradient,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                    boxShadow: customDarkShadow
                ),
                child: Stack(
                  children:[
                    ListView(
                    children: [
                      Ink(

                          child: Row(
                            children: [
                              Icon(Icons.person,size: 42,color: hexToColor("#FFFFFF"),),
                              SizedBox(width: 15,),
                              Text("Deepesh Malviya",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w300,color: Colors.white),)
                            ],
                          ),

                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Divider
                        (
                        color: Colors.lightGreenAccent,
                        height: 1,
                      ),
                      SizedBox(
                        height: 7,
                      ),

                      Ink(

                        child: Row(
                          children: [
                            Icon(Icons.alternate_email,size: 40,color: hexToColor("#FFFFFF"),),
                            SizedBox(width: 15,),
                            Flexible(
                              child: Text("deepeshmalviya@outlook.com",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300,color: Colors.white,),
                              overflow: TextOverflow.clip,
                              maxLines: 2,),
                            )
                          ],
                        ),

                      ),

                      SizedBox(
                        height: 7,
                      ),
                      Divider
                        (
                        color: Colors.lightGreenAccent,
                        height: 1,
                      ),
                      SizedBox(
                        height: 7,
                      ),


                      Ink(

                        child: Row(
                          children: [
                            Icon(Icons.call,size: 40,color: hexToColor("#FFFFFF"),),
                            SizedBox(width: 15,),
                            Flexible(
                              child: Text("7774043339",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300,color: Colors.white,),
                                overflow: TextOverflow.clip,
                                maxLines: 2,),
                            )
                          ],
                        ),

                      ),

                      SizedBox(
                        height: 7,
                      ),
                      Divider
                        (
                        color: Colors.lightGreenAccent,
                        height: 1,
                      ),
                      SizedBox(
                        height: 7,
                      ),


                      Ink(

                        child: Row(
                          children: [
                            Icon(Icons.cake,size: 40,color: hexToColor("#FFFFFF"),),
                            SizedBox(width: 15,),
                            Flexible(
                              child: Text("March 14,1991",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300,color: Colors.white,),
                                overflow: TextOverflow.clip,
                                maxLines: 2,),
                            )
                          ],
                        ),

                      ),

                      SizedBox(
                        height: 7,
                      ),
                      Divider
                        (
                        color: Colors.lightGreenAccent,
                        height: 1,
                      ),
                      SizedBox(
                        height: 7,
                      ),


                      Ink(

                        child: Row(
                          children: [
                            Icon(Icons.room,size: 40,color: hexToColor("#FFFFFF"),),
                            SizedBox(width: 15,),
                            Flexible(
                              child: Text("B-201 Regalia Residency, Pune-Mumbai Highway, Bavdhan, Pune 411021,",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w300,color: Colors.white,),
                                overflow: TextOverflow.clip,
                                maxLines: 4,),
                            )
                          ],
                        ),

                      ),

                      SizedBox(
                        height: 7,
                      ),
                      Divider
                        (
                        color: Colors.lightGreenAccent,
                        height: 1,
                      ),
                      SizedBox(
                        height: 50,
                      ),








                    ],
                  ),


                          Positioned(bottom: 20, right: 1 ,
                          child: InkWell(

                            child: Container(
                                height: 50,
                                width: 160,
                                decoration: BoxDecoration(
                                    boxShadow: customDarkShadow,
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                    color: Colors.limeAccent
                                ),


                                child:Center(child: Text("Update Profile",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),))

                            ),
                            onTap: (){
                              Navigator.of(context).pushNamed("/update_address");

                            },

                          ),
                        ),

                  ],

                ),



              ),
            )

          ],
        ),
      ),
    );
  }
}
