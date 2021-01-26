import 'package:e_commerce_dashboard/app/models/AddressModel.dart';
import 'package:e_commerce_dashboard/app/utils/Utils.dart';
import 'package:e_commerce_dashboard/app/widgets/MyAppBar.dart';
import 'package:e_commerce_dashboard/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UpdateAddress extends StatefulWidget {
  @override
  _UpdateAddressState createState() => _UpdateAddressState();
}

class _UpdateAddressState extends State<UpdateAddress> {



  TextEditingController textEditingControllerName=TextEditingController();
  TextEditingController textEditingControllerHouse=TextEditingController();
  TextEditingController textEditingControllerStreet=TextEditingController();
  TextEditingController textEditingControllerArea=TextEditingController();
  TextEditingController textEditingControllerLandmark=TextEditingController();
  TextEditingController textEditingControllerCity=TextEditingController();
  TextEditingController textEditingControllerPin=TextEditingController();
  TextEditingController textEditingControllerMobile=TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadInitialAddress();
  }

  void loadInitialAddress(){

     textEditingControllerName.text=MyApp.deliveryAddress.name;
     textEditingControllerHouse.text=MyApp.deliveryAddress.houseNumber;
     textEditingControllerStreet.text=MyApp.deliveryAddress.street;
     textEditingControllerLandmark.text=MyApp.deliveryAddress.landmark;
     textEditingControllerArea.text=MyApp.deliveryAddress.area;
     textEditingControllerCity.text=MyApp.deliveryAddress.city;
     textEditingControllerPin.text=MyApp.deliveryAddress.pincode;
     textEditingControllerMobile.text=MyApp.deliveryAddress.contactNumber;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: MyAppBar("Update Address", false, 10),

        body: Column(
            children: [
              Expanded(child: ListView(
                padding: EdgeInsets.all(15),
                children: [
                  TextField(
                    controller: textEditingControllerName,
                    decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.userAlt),
                      hintText: "Enter full name",
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  //House

                  TextField(
                    controller: textEditingControllerHouse,
                    decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.home),
                      hintText: "Enter house number",
                    ),

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: textEditingControllerStreet,
                    decoration: InputDecoration(

                      prefixIcon: Icon(FontAwesomeIcons.road),
                      hintText: "Enter street name",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: textEditingControllerLandmark,
                    decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.landmark),
                      hintText: "Enter nearest landmark",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: textEditingControllerArea,
                    decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.mapMarkedAlt),
                      hintText: "Enter Area",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: textEditingControllerCity,
                    decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.city),
                      hintText: "Enter city name",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: textEditingControllerPin,
                    decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.mapPin),
                      hintText: "Enter city pin",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: textEditingControllerMobile,
                    decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.phoneAlt),
                      hintText: "Enter mobile number",
                    ),
                  ),
                ],

              )
              ),
              InkWell(


                child: Container(
                  decoration: BoxDecoration(
                      gradient: linearGradient,
                      borderRadius:
                      BorderRadius.circular(
                          30.0)),
                  constraints: BoxConstraints(
                      maxWidth: 250.0,
                      minHeight: 55.0),
                  alignment: Alignment.center,

                  child: Text(
                    "Update Address",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white),
                  ),
                ),

                onTap: (){

                  setState(() {
                    MyApp.deliveryAddress.name=textEditingControllerName.text;
                    MyApp.deliveryAddress.houseNumber=textEditingControllerHouse.text;
                    MyApp.deliveryAddress.street=textEditingControllerStreet.text;
                    MyApp.deliveryAddress.landmark=textEditingControllerLandmark.text;
                    MyApp.deliveryAddress.area=textEditingControllerArea.text;
                    MyApp.deliveryAddress.city=textEditingControllerCity.text;
                    MyApp.deliveryAddress.pincode=textEditingControllerPin.text;
                    MyApp.deliveryAddress.contactNumber=textEditingControllerMobile.text;

                  });

                  Navigator.pop(context, 'Updated');
                },
              ),
              SizedBox(height: 20,)
            ])


    );
  }
}
