import 'package:e_commerce_dashboard/app/models/AddressModel.dart';
import 'package:e_commerce_dashboard/app/models/ProductDetailsModel.dart';
import 'package:flutter/material.dart';

import 'app/utils/RouteGenerator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {


  static Set<ProductDetailsModel> cartList=Set();
  static AddressModel deliveryAddress=AddressModel();
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        
          primarySwatch: Colors.teal,
          cursorColor: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/',
        onGenerateRoute:RouteGenerator.generateRoute);
  }
}





