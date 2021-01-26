import 'package:e_commerce_dashboard/app/view/Dashboard.dart';
import 'package:e_commerce_dashboard/app/view/OrderSummary.dart';
import 'package:e_commerce_dashboard/app/view/ProductDetailsScreen.dart';
import 'package:e_commerce_dashboard/app/view/ProfileScreen.dart';
import 'package:e_commerce_dashboard/app/view/SubCategoryScreen.dart';
import 'package:e_commerce_dashboard/app/view/UpdateAddress.dart';
import 'package:e_commerce_dashboard/app/view/prelogin_screen/IntroductionScreen.dart';
import 'package:e_commerce_dashboard/app/view/prelogin_screen/SplashScreen.dart';
import 'package:flutter/material.dart';

import '../view/AddToCartScreen.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings routeSettings){

    switch(routeSettings.name){
      case '/':
        return MaterialPageRoute(builder: (_)=> SplashScreen());
        break;

      case '/introduction':
        return MaterialPageRoute(builder: (_)=> IntroductionScreen());

        break;

      case '/dashboard':
        return MaterialPageRoute(builder: (_)=>Dashboard());

      case '/sub_category':
        final args=routeSettings.arguments;
        return MaterialPageRoute(builder: (_)=>SubCategoryScreen(args));

      case '/product_details':
        final args=routeSettings.arguments;
        return MaterialPageRoute(builder: (_)=>ProductDetailsScreen(args));

      case '/add_to_cart':

        return MaterialPageRoute(builder: (_)=>AddToCartScreen());

      case '/order_summary':
        return MaterialPageRoute(builder: (_)=>OrderSummary());

      case '/update_address':
        return MaterialPageRoute(builder: (_)=>UpdateAddress());

      case '/profile':
        return MaterialPageRoute(builder: (_)=>ProfileScreen());





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