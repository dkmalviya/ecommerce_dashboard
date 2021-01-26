import 'package:e_commerce_dashboard/app/utils/Utils.dart';
import 'package:e_commerce_dashboard/main.dart';
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
            child:
        GestureDetector(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(Icons.shopping_cart, color: Colors.black),
              _buildChild()



            ],
          ),
          onTap: (){
            Navigator.of(context).pushNamed("/add_to_cart");
          },
        )
        )
      ],
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: linearGradient),
      ),
    );
  }

  Widget _buildChild() {
    if (MyApp.cartList.length>0) {
      return Padding(padding: const EdgeInsets.only(left: 5.0),
         child: Container(
          width: 30,
          height: 30,
          child: Stack(
            children: [
              Icon(
                Icons.shopping_cart,
                color: Colors.black,
                size: 35,
              ),
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.topRight,
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xffc32c37),
                      border: Border.all(color: Colors.white, width: 1)),
                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Center(
                      child: Text(
                        MyApp.cartList.length.toString(),
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
       ));
    }
    else{
      return null;
    }

  }

  @override
  Size get preferredSize {
    return Size.fromHeight(kToolbarHeight);
  }
}
