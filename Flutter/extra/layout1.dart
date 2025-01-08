import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Layoutone extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Layout 4'),),
      body: Row(
        children: [
          Expanded(child: Column(
            children: [
              Expanded(child: Row(
                children: [
                  Expanded(child: Column(
                    children: [
                      Expanded(child: Container(color: Colors.brown,)), 
                      Expanded(child: Container(color: Colors.white,)), 
                      Expanded(child: Container(color: Colors.grey,)),
                    ],
              ))],)),

              Expanded(child: Row(children: [Expanded(child: Row(
                children: [
                  Expanded(child: Container(color: Colors.red,)),
                  Expanded(child: Container(color: Colors.purple,)),
                  Expanded(child: Container(color: Colors.brown,)),
                ],
              ))],)),
              Expanded(child: Row(children: [
                Expanded(child:Column(
                  children: [
                    Expanded(child: Container(color: Colors.green,)),
                    Expanded(child: Container(color: Colors.black,)),
                    Expanded(child: Container(color: Colors.yellow,)),
                  ],
                ))],)),

            ],
          )),
          Expanded(child: Column(
            children: [
              Expanded(child:Row(children: [
                Expanded(flex:2,child: Container(color: Colors.blue,)),
                Expanded(child: Container(color: Colors.lightBlueAccent,)),
                Expanded(flex:2,child: Container(color: Colors.greenAccent,))
              ],)),
              Expanded(child: Column(
                children: [
                  Expanded(child: Row(
                    children: [
                      Expanded(flex:2,child: Container(color: Colors.brown,)),
                      Expanded(flex:2,child: Container(color: Colors.green,)),
                      Expanded(flex:3,child: Container(color: Colors.purple,)),
                      Expanded(child: Container(color: Colors.green,)),
                      Expanded(child: Container(color: Colors.blue,))
                    ],
                  ))
                ],
              )),
              Expanded(child: Column(
                children: [
                  Expanded(child: Column(
                    children: [
                      Expanded(child: Container(color: Colors.grey,)),
                      Expanded(flex:1,child: Container(color: Colors.blue,)),
                      Expanded(flex:2,child: Container(color: Colors.purple,)),
                    ],
                  ))
                ],
              )),
              Expanded(child: Column(
                children: [
                  Expanded(child: Row(
                    children: [
                      Expanded(flex:2,child: Container(color: Colors.lightBlueAccent,)),
                      Expanded(child: Container(color: Colors.blue,)),
                      Expanded(child: Container(color: Colors.lightGreenAccent,))
                    ],
                  ))
                ],
              )),
              Expanded(child: Column(
                children: [
                  Expanded(child: Row(
                    children: [
                      Expanded(child: Container(color: Colors.purple,)),
                      Expanded(child: Container(color: Colors.green,)),
                      Expanded(child: Container(color: Colors.blue,)),
                    ],
                  ))
                ],
              )),
            ],
          ))
        ],
      ),
    );
  }

}