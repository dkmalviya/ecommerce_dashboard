import 'package:e_commerce_dashboard/app/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(child: Container(

      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
                gradient: linearGradient
            ),
            accountEmail: Text("deepeshmalviya@outlook.com"),
            accountName: Text("Deepesh Malviya"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.black,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Center(
                  child:  Image.asset(
                        "assets/images/app_icon.png",
                        width: 38,
                      ),
                ),
              ),
            ),
          ),


          ListTile(
            title: Text("Home",
              style: TextStyle(
                color: hexToColor("#15bf9e"),
              ),),
            leading: Icon(
                FontAwesomeIcons.home, color: hexToColor("#15bf9e")),
            onTap: () {
                Navigator.of(context).popAndPushNamed("/dashboard");

            },
          ),

          ListTile(
            title: Text("Cart",
              style: TextStyle(
                color: hexToColor("#15bf9e"),
              ),),
            leading: Icon(
              FontAwesomeIcons.shoppingCart, color: hexToColor("#15bf9e"),),

            onTap: () {
              Navigator.of(context).popAndPushNamed("/add_to_cart");
            },
          ),

          ListTile(
            title: Text("My Orders",
              style: TextStyle(
                color: hexToColor("#15bf9e"),
              ),),
            leading: Icon(
                FontAwesomeIcons.firstOrder, color: hexToColor("#15bf9e")),

            onTap: () {
              Navigator.of(context).popAndPushNamed("/my_orders");
            },
          ),

          ListTile(
            title: Text("Profile",
              style: TextStyle(
                color: hexToColor("#15bf9e"),
              ),),
            leading: Icon(
                FontAwesomeIcons.user, color: hexToColor("#15bf9e")),

            onTap: () {

              Navigator.of(context).popAndPushNamed("/profile");

            },
          ),

          ListTile(
            title: Text("Favorites",
              style: TextStyle(
                color: hexToColor("#15bf9e"),
              ),),
            leading: Icon(
                FontAwesomeIcons.star, color: hexToColor("#15bf9e")),

            onTap: () {
           //   Navigator.of(context).popAndPushNamed("/favorite");
            },
          ),

          ListTile(
            title: Text("FAQs",
              style: TextStyle(
                color: hexToColor("#15bf9e"),
              ),),
            leading: Icon(
                FontAwesomeIcons.questionCircle, color: hexToColor("#15bf9e")),

            onTap: () {
              //Navigator.of(context).popAndPushNamed("/faq");
            },
          ),

          ListTile(
            title: Text("Share",
              style: TextStyle(
                color: hexToColor("#15bf9e"),
              ),),
            leading: Icon(
                FontAwesomeIcons.share, color: hexToColor("#15bf9e")),

            onTap: () {
              //Navigator.of(context).popAndPushNamed("/share");
            },
          ),

          ListTile(
            title: Text("Logout",
              style: TextStyle(
                color: hexToColor("#15bf9e"),
              ),),
            leading: Icon(
                FontAwesomeIcons.signOutAlt, color: hexToColor("#15bf9e")),

            onTap: () {

            },
          ),
        ],
      ),
    ),

    );
  }
}
