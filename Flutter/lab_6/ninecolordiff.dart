import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColorDifferent extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
       body:Row(
         children: [
           Expanded(child: Column(
             children: [
               Expanded(child: Container(color: Colors.red)),
               Expanded(child: Container(color: Colors.blue)),
               Expanded(child: Container(color: Colors.green)),
             ],
           )),
           Expanded(child: Column(
             children: [
               Expanded(flex:2,child: Container(color: Colors.yellow)),
               Expanded(flex:2,child: Container(color: Colors.purple)),
               Expanded(flex:1,child: Container(color: Colors.amber)),
             ],
           )),Expanded(child: Column(
             children: [
               Expanded(flex:1,child: Container(color: Colors.cyanAccent)),
               Expanded(flex:4,child: Container(color: Colors.white38)),
               Expanded(flex:2,child: Container(color: Colors.pink)),
             ],
           ))

         ],
       ),
     );
  }

}