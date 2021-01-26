import 'package:e_commerce_dashboard/app/models/OrderDetailsModel.dart';
import 'package:e_commerce_dashboard/app/utils/Utils.dart';
import 'package:e_commerce_dashboard/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FailedOrderWidget{

  OrderDetailsModel _orderDetailsModel;

  bool visible=false;
  FailedOrderWidget(this._orderDetailsModel);

  showAlertDialog(BuildContext context) {

    final alert = AlertDialog(

      contentPadding: EdgeInsets.all(0.0),
      scrollable: true,
      content: Container(
          padding: EdgeInsets.fromLTRB(50, 35, 35, 30),
          decoration: new BoxDecoration(
            gradient:LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                colors: [
                  hexToColor("#FF512F"),
                  hexToColor("#DD2476"),
                ]),),

          child: SingleChildScrollView
            (
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[


                Icon(FontAwesomeIcons.timesCircle,color: Colors.white,size: 60,),

                SizedBox(height: 40),
                Text("OOPS!",style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.w300),),
                SizedBox(height: 10),

                Text("Please try after some time.",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w300),),
                SizedBox(height: 10),
                Divider(
                  color: Colors.limeAccent,
                  height: 1,
                ),
                SizedBox(height: 10),

                Text("Order Id: ${_orderDetailsModel.orderNumber}",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w300),),
                SizedBox(height: 40),


                Container(

                  child: FlatButton(
                    minWidth: 140,
                    height: 40,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        side: BorderSide(color: Colors.white,width: 1)
                    ),

                    child: Text('OK',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil('/dashboard', (Route<dynamic> route) => false);
                    },
                  ),
                ),
              ],),)

      ),
    );
    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );

  }

}