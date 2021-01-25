import 'package:e_commerce_dashboard/app/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  String title;
  bool isCartVisible = false;

  int cartCount;

  MyAppBar(this.title, this.isCartVisible, this.cartCount);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      //leading:
      /*Container(
          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 0),
          child: Hero(
              tag: "hero1",
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 74.0,
                child: Image.asset(
                  "assets/images/app_icon.png",
                  width: 38,
                ),
              ))),*/
      actions: [
        Visibility(
            visible: isCartVisible,
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed("/add_to_cart");

              },
            ))
      ],
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: linearGradient),
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight);
  }
}
