import 'package:e_commerce_dashboard/app/view/Dashboard.dart';
import 'package:e_commerce_dashboard/app/view/ProductDetailsScreen.dart';
import 'package:e_commerce_dashboard/app/view/SplashScreen.dart';
import 'package:e_commerce_dashboard/app/view/SubCategoryScreen.dart';
import 'package:flutter/material.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings routeSettings){

    switch(routeSettings.name){
      case '/':
        return MaterialPageRoute(builder: (_)=> SplashScreen());
      case '/dashboard':
        return MaterialPageRoute(builder: (_)=>Dashboard());

      case '/sub_category':
        final args=routeSettings.arguments;
        return MaterialPageRoute(builder: (_)=>SubCategoryScreen(args));

      case '/product_details':
        final args=routeSettings.arguments;
        return MaterialPageRoute(builder: (_)=>ProductDetailsScreen(args));



      default:
        return _errorRoute();
    }
  }
  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
        body: Center(
          child: Text("error"),
        ),
      );
    });
  }
}