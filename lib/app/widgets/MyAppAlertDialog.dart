import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyAppAlertDialog {
  String title;
  String message;
  String dismissButtonTitle;
  Function onPressedActionButton;
  Function onPressedDismissButton;
  Function onPressedCloseButton;
  String actionButtonTitle;
  bool isActionButtonVisible;
  bool isDismissButtonVisible;
  bool isCloseButtonVisible;
  String closeButtonTitle;

  MyAppAlertDialog(this.title,this.message,this.isDismissButtonVisible,this.dismissButtonTitle,this.onPressedDismissButton,this.isActionButtonVisible,this.actionButtonTitle,this.onPressedActionButton,this.isCloseButtonVisible,this.closeButtonTitle,this.onPressedCloseButton);


  showAlertDialog(BuildContext context) {

    // set up the button
    final okButton =  Visibility(
        visible: isActionButtonVisible,
        child:FlatButton(
          child: Text(actionButtonTitle),
          onPressed:onPressedActionButton,
        )
    );

    final cancleButton= Visibility(
        visible: isDismissButtonVisible,
        child:FlatButton(
      child: Text(dismissButtonTitle),
      onPressed:onPressedDismissButton
    )
    );
    final closeButton= Visibility(
        visible: isCloseButtonVisible,
        child:FlatButton(
            child: Text(closeButtonTitle),
            onPressed:onPressedCloseButton
        )
    );


    // set up the AlertDialog
    final alert=AlertDialog(

      title: Text(title),
      content: Container(
          width: double.maxFinite,
          child: Text(
            message
          )
      ),
      actions: <Widget>[
        okButton,
        cancleButton,
        closeButton
      ],
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