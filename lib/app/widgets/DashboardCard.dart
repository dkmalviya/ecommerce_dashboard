import 'package:e_commerce_dashboard/app/models/CategoryModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  const DashboardCard({Key key, this.choice}) : super(key: key);
  final CategoryModel choice;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      child: Card(
          child:  Center(child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Image.asset(choice.imageName,width: 50,),
                SizedBox(height: 25,),
                Text(choice.title, style: TextStyle(fontSize: 12)),

              ]
          ),
          )
      ),

      onTap: (){
        print("Tapped product");
        print(choice);
        Navigator.of(context).pushNamed("/sub_category",arguments: choice);
      },
    );
  }
}