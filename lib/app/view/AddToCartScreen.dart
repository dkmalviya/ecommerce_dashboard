import 'package:e_commerce_dashboard/app/models/ProductDetailsModel.dart';
import 'package:e_commerce_dashboard/app/utils/Utils.dart';
import 'package:e_commerce_dashboard/app/widgets/MyAppAlertDialog.dart';
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
  double totalAmount=0;
  double amount=0;
  double additionalCharges=0;
  List<ProductDetailsModel> cartList=MyApp.cartList.toList();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recalculateAmount();
  }


  void recalculateAmount(){
    totalAmount=0;
    amount=0;
    additionalCharges=0;

    for (int i=0; i<cartList.length;i++){

      setState(() {
        amount=amount+cartList[i].price;
      });
    }

    setState(() {
      totalAmount=amount+additionalCharges;
    });


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: MyAppBar("My Cart", false, 0),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,

        child:Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount:cartList.length,
                  itemBuilder: (context, index) {
                    return Container(

                        padding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        child: Card(
                          child: Container(

                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            child: Column(

                              children: [
                                ListTile(
                                  leading:
                                  CircleAvatar(
                                    backgroundColor: Colors.black,
                                    radius: 28.0,
                                    child: Image.asset(
                                      "assets/images/app_icon.png",
                                      width: 45,
                                    ),

                                  ),
                                  title: Text(

                                      cartList[index].name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 1,
                                      overflow:TextOverflow.ellipsis
                                  ),
                                  subtitle: Text(
                                    cartList[index].brand,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w200),
                                  ),
                                  trailing: InkWell(

                                      child: Icon(
                                        Icons.delete_forever,
                                        size: 36,
                                        color: Colors.red,

                                      ),
                                      onTap: (){

                                        MyAppAlertDialog("Alert", "Are you sure you want to remove form cart?", true, "No", (){
                                          Navigator.of(context).pop();
                                        }, true, "Yes", (){

                                          if(MyApp.cartList.contains(cartList[index])){
                                            MyApp.cartList.remove(cartList[index]);
                                            setState(() {
                                              cartList.removeAt(index);
                                            });


                                          }
                                          recalculateAmount();

                                          Navigator.of(context).pop();

                                        }, false, "", (){

                                        }).showAlertDialog(context);

                                      }) ,

                                ),


                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  height: 1,
                                  indent: 10,
                                  endIndent: 10,
                                  color: hexToColor("#6ae7a7"),
                                ),
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Quantity",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300),
                                        ),
                                        new Text(
                                          cartList[index]
                                              .qantitySelectedByUser
                                              .toString()+ " x "+cartList[index].weight.toString() +
                                              " " +
                                              cartList[index]
                                                  .unit
                                                  .toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300),
                                        ),

                                        Text(
                                          "\u20B9 "+cartList[index].price.toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300),
                                        )
                                      ],
                                    )),


                              ],
                            ),
                          ),
                        )
                    );
                  }
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 20,left: 20,right: 20),
              height: 180,

              decoration: BoxDecoration(
                  gradient: linearGradient,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                  boxShadow: customDarkShadow
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Amount : ",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.white
                          ),

                          maxLines: 1,
                          overflow:TextOverflow.ellipsis
                      ),

                      Text(
                          "\u20B9 "+amount.toString(),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.white
                          ),
                          maxLines: 1,
                          overflow:TextOverflow.ellipsis
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Additional Charges : ",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.white
                          ),

                          maxLines: 1,
                          overflow:TextOverflow.ellipsis
                      ),

                      Text(
                          "+ \u20B9 "+additionalCharges.toString(),
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.white
                          ),
                          maxLines: 1,
                          overflow:TextOverflow.ellipsis
                      ),

                    ],
                  ),

                  SizedBox(
                    height: 5,
                  ),
                  Divider
                    (
                    color: Colors.lightGreenAccent,
                    height: 1,
                  ),
                  SizedBox(
                    height: 5,
                  ),


                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "Total Amount : ",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: Colors.white
                          ),

                          maxLines: 1,
                          overflow:TextOverflow.ellipsis
                      ),

                      Text(
                          "\u20B9 "+totalAmount.toString(),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: Colors.white
                          ),
                          maxLines: 1,
                          overflow:TextOverflow.ellipsis
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider
                    (
                    color: Colors.lightGreenAccent,
                    height: 1,
                  ),
                  SizedBox(
                    height: 5,
                  ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        InkWell(

                          child: Container(
                            padding: EdgeInsets.only(right: 15),
                            decoration: BoxDecoration(
                              boxShadow: customDarkShadow,
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.limeAccent
                            ),


                            child: Row(
                              children: [
                                IconButton(icon: Icon(Icons.shopping_cart,size: 32,color: hexToColor("#15bf9e"),),tooltip: "Checkout", onPressed: (){
                                }),
                                Text("CheckOut",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),)
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.of(context).pushNamed("/order_summary");

                          },

                        ),
                      ],
                    )


                ],
              ),

            )
          ],
        ),

      ),

    );
  }
}
