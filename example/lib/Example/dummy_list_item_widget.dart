import 'package:flutter/material.dart';

class DummyListItemWidget extends StatelessWidget {
  const DummyListItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(10),
      height: 100,
      margin:const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 2,
          )
        ]
      ),
      child:const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Dummy List Item Wigdet",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          SizedBox(height: 5,),
          FlutterLogo(size: 45,)
        ],
      ),
    );
  }
}