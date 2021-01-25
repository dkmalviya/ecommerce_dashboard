import 'package:e_commerce_dashboard/app/utils/Utils.dart';
import 'package:e_commerce_dashboard/app/widgets/MyAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderSummary extends StatefulWidget {
  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {
  List<Icon> paymentMethods = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    paymentMethods.add(Icon(FontAwesomeIcons.amazonPay,size: 32,));
    paymentMethods.add(Icon(FontAwesomeIcons.googlePay,size: 32));
    paymentMethods.add(Icon(FontAwesomeIcons.paypal,size: 32));
    paymentMethods.add(Icon(FontAwesomeIcons.applePay,size: 32));
    paymentMethods.add(Icon(FontAwesomeIcons.ccMastercard,size: 32));
    paymentMethods.add(Icon(FontAwesomeIcons.ccVisa,size: 32));
  }

  @override
  Widget build(BuildContext context) {
    final orderDetailSection =Column(
      children: [
        Row(
          children: [
            Text(

                "Order Details :",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow:TextOverflow.ellipsis
            ),
            //Title
          ],
        ),
        SizedBox(height: 10,),
        Divider(
          height: 1,
          color: hexToColor("#6ae7a7"),
        ),

        SizedBox(height: 10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(

                "Order Number :",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 1,
                overflow:TextOverflow.ellipsis
            ),

            Text(

                "123456789",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
                maxLines: 1,
                overflow:TextOverflow.ellipsis
            ),
            //Order Number
          ],
        ),
        SizedBox(height: 10,),
        Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(

                "Total Item :",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 1,
                overflow:TextOverflow.ellipsis
            ),

            Text(

                "12",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
                maxLines: 1,
                overflow:TextOverflow.ellipsis
            ),
            //Quantity
          ],
        ),
        SizedBox(height: 10,),

        Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(

                "Total Amount :",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 1,
                overflow:TextOverflow.ellipsis
            ),

            Text(

                "\u20B9 12",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
                maxLines: 1,
                overflow:TextOverflow.ellipsis
            ),     //Amount
          ],
        ),

      ],
    );

    final contactInformationSection=Column(
      children: [
        Row(
          children: [
            Text(

                "Delivery Details :",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow:TextOverflow.ellipsis
            ),
            //Delivery Address Secion
          ],
        ),
        SizedBox(height: 10,),
        Divider(
          height: 1,
          color: hexToColor("#6ae7a7"),
        ),

        SizedBox(height: 10,),

        Row(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(

                "Name :",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 1,
                overflow:TextOverflow.ellipsis
            ),

            Text(

                "Deepesh Malviya",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
                maxLines: 1,
                overflow:TextOverflow.ellipsis
            ),
            //Name
          ],
        ),
        SizedBox(height: 10,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(

                "Address :",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 1,
                overflow:TextOverflow.ellipsis
            ),
            SizedBox(width: 40,),
            Expanded(
              child: Text(

                  "B-201 Regalia Residency,\nPune-Mumbai highway,Bavdhan Pune 411021",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,

                  ),
                  maxLines: 5,

                  overflow:TextOverflow.visible
              ),
            ),
            //addredd Line 1
          ],
        ),
        SizedBox(height: 10,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(

                "Contact No :",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
                maxLines: 1,
                overflow:TextOverflow.ellipsis
            ),

            Text(

                "7774043339",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
                maxLines: 1,
                overflow:TextOverflow.ellipsis
            )
          ],
        ),
      ],
    );

    return Scaffold(
      appBar: MyAppBar("Order Summary", false, 0),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(12),
              child: Column(
                children: [
                  Card(

                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        child: orderDetailSection
                    ),
                    elevation: 8,

                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(

                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                        child: contactInformationSection
                    ),
                    elevation: 8,

                  ),
                  SizedBox(
                    height: 20,
                  ),

                  Text(

                      "We accept all king of payment like :",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,

                      ),
                      maxLines: 1,

                      overflow:TextOverflow.visible
                  ),

                  Expanded(
                      child: GridView.count(
                          crossAxisCount: 6,
                          crossAxisSpacing: 2.0,
                          mainAxisSpacing: 6.0,
                          children: List.generate(paymentMethods.length, (index) {
                            return Center(
                              child: paymentMethods[index],
                            );
                          }))),
                  Divider(
                    height: 1,
                    color: hexToColor("#6ae7a7"),
                  ),

                  SizedBox(height: 20,),
                  Text(

                      "Note :Click on Place order to confirm your order.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,

                      ),
                      maxLines: 2,

                      overflow:TextOverflow.visible
                  ),
                  SizedBox(height: 20,)

                ],
              ),

            ),
          ),
          Ink(
            decoration: BoxDecoration(
                gradient: linearGradient,
                borderRadius:
                BorderRadius.circular(
                    30.0)),
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: 250.0,
                  minHeight: 55.0),
              alignment: Alignment.center,

              child: Text(
                "Place Order",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
