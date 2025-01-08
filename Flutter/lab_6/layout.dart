import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Layout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("LAYOUT 1",style:
        TextStyle(fontSize: 20),),),
      body: Column(
        children: [
          Expanded(flex:2,child: Container(color:  Colors.red,)),
          Expanded(flex:2,child: Row(
          children: [
            Expanded(flex:2,child: Container(color:Colors.blue),),
            Expanded(child: Column(
              children: [
                Expanded(child: Container(color: Colors.purple,)),
                Expanded(child: Container(color: Colors.pink,))
              ],
            ))
          ],
          ),),
          Expanded(child: Row(
            children: [
              Expanded(child: Container(color: Colors.black,)),
              Expanded(child: Container(color: Colors.orange,)),
              Expanded(child: Container(color: Colors.cyanAccent,)),
            ],
          ),),
        ],
      )

    );
  }

}