import 'package:e_commerce_dashboard/app/utils/Utils.dart';
import 'package:e_commerce_dashboard/app/widgets/MyAppBar.dart';
import 'package:e_commerce_dashboard/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddToCartScreen extends StatefulWidget {
  @override
  _AddToCartScreenState createState() => _AddToCartScreenState();
}

class _AddToCartScreenState extends State<AddToCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: MyAppBar("My Cart", false, 0),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child:ListView.builder(
            itemCount: MyApp.cartList.length,
            itemBuilder: (context, index) {
              return Container(

                  padding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Card(
                    child: Container(

                      padding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: Column(

                        children: [
                          Row(
                            children: [
                              Hero(
                                tag: "hero6",
                                child: CircleAvatar(
                                  backgroundColor: Colors.black,
                                  radius: 35.0,
                                  child: Image.asset(
                                    "assets/images/app_icon.png",
                                    width: 50,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    MyApp.cartList[index].name,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    MyApp.cartList[index].brand,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200),
                                  )
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Available Quantity",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200),
                                  ),
                                  Text(
                                    MyApp.cartList[index]
                                        .quantityAvailable
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200),
                                  )
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Price",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200),
                                  ),
                                  Text(
                                    "\u20B9 "+MyApp.cartList[index].price.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200),
                                  )
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Weight",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200),
                                  ),
                                  Text(
                                    MyApp.cartList[index].weight.toString() +
                                        " " +
                                        MyApp.cartList[index]
                                            .unit
                                            .toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200),
                                  )
                                ],
                              )),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Select Quantity",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200),
                                  ),
                                  FloatingActionButton(
                                    heroTag: "minus",
                                    child: Icon(FontAwesomeIcons.minus,
                                        size: 20, color: Colors.black87),
                                    backgroundColor: Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        MyApp.cartList[index]
                                            .qantitySelectedByUser--;
                                      });
                                    },
                                  ),
                                  new Text(
                                    MyApp.cartList[index]
                                        .qantitySelectedByUser
                                        .toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w200),
                                  ),
                                  FloatingActionButton(
                                    heroTag: "plus",
                                    child: Icon(FontAwesomeIcons.plus,
                                        size: 20, color: Colors.black87),
                                    backgroundColor: Colors.white,
                                    onPressed: () {
                                      setState(() {
                                        MyApp.cartList[index]
                                            .qantitySelectedByUser++;
                                      });
                                    },
                                  )
                                ],
                              )),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                height: 50.0,
                                child: RaisedButton(
                                  elevation: 5,
                                  onPressed: () {},
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(80.0)),
                                  padding: EdgeInsets.all(0.0),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                        gradient: linearGradient,
                                        borderRadius:
                                        BorderRadius.circular(30.0)),
                                    child: Container(
                                      constraints: BoxConstraints(
                                          maxWidth: 180.0,
                                          minHeight: 40.0),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Add To Cart",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
              );
            }
            ),

      ),

    );
  }
}
