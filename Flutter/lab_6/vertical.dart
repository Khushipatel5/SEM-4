import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Vertical extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:
          //for vertical division
      // Row(
      //   children: [
      //     Expanded(child: Container(color: Colors.orange,)),
      //     Expanded(child: Container(color: Colors.red,)),
      //     Expanded(child: Container(color: Colors.blue,))
      //   ],
      // ),


      //for horizontal division
      Column(
        children: [
          Expanded(child: Container(color:  Colors.red,)),
          Expanded(child: Container(color:  Colors.yellow,)),
          Expanded(child: Container(color:  Colors.orange,)),
        ],
      )
    );
  }


}