import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Layoutthree extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Layout -3 '),),
      body: Column(
        children: [
          Expanded(child: Column(
            children: [
              Expanded(child: Row(
                children: [
                  Expanded(flex:3,child: Container(color: Colors.brown,)),
                  Expanded(child: Container(color: Colors.blue,)),
                ],))]),),
          Expanded(child: Column(children: [
            Expanded(child:Row(
              children: [
                Expanded(child: Container(color: Colors.yellow,)),
                Expanded(child: Column(
                  children: [
                    Expanded(child: Column(children: [
                      Expanded(child: Row(
                        children: [
                          Expanded(child: Container(color: Colors.blue,)),
                          Expanded(child: Container(color: CupertinoColors.activeBlue,))
                        ],
                      ))
                    ],)),
                    Expanded(child: Column(
                      children: [
                        Expanded(child: Row(
                          children: [
                            Expanded(child: Container(color: Colors.purple,)),
                            Expanded(child: Container(color: Colors.green,))
                          ],
                        ))
                      ],
                    ))
                  ],
                )),
                Expanded(child: Container(color: Colors.red,)),
              ],))],)),
          Expanded(child: Column(
            children: [
              Expanded(child: Row(children: [
                Expanded(child: Container(color: Colors.black,)),
                Expanded(child: Container(color: Colors.white,)),
                Expanded(child: Container(color: Colors.black,)),
                Expanded(child: Container(color: Colors.white,)),

              ],))
            ],
          )),
          Expanded(child: Row(
            children: [

              Expanded(child: Row(children: [
                Expanded(child: Column(
                  children: [
                    Expanded(child: Container(color: Colors.grey,)),
                    Expanded(child: Container(color: Colors.blue,))
                  ],
                )),Expanded(child: Column(
                  children: [
                    Expanded(child: Column(
                      children: [
                        Expanded(child: Row(
                          children: [
                            Expanded(child: Container(color: Colors.yellow,)),
                            Expanded(child: Container(color: Colors.purple,))
                          ],
                        )),
                        Expanded(child: Row(
                          children: [
                            Expanded(child: Container(color: Colors.green,)),
                            Expanded(child: Container(color: Colors.white,))
                          ],
                        ))
                      ],
                    )),
                    Expanded(child: Container(color: Colors.brown,))
                  ],
                ))
              ],)),
              Expanded(child: Row(children: [
                Expanded(child: Container(color: Colors.green,))
              ],)),
              Expanded(child: Row(children: [
                Expanded(child: Column(
                  children: [
                    Expanded(child: Container(color: Colors.grey,)),
                    Expanded(child: Container(color: Colors.blue,))
                  ],
                )),Expanded(child: Column(
                  children: [
                    Expanded(child: Column(
                      children: [
                        Expanded(child: Row(
                          children: [
                            Expanded(child: Container(color: Colors.yellow,)),
                            Expanded(child: Container(color: Colors.purple,))
                          ],
                        )),
                        Expanded(child: Row(
                          children: [
                            Expanded(child: Container(color: Colors.green,)),
                            Expanded(child: Container(color: Colors.white,))
                          ],
                        ))
                      ],
                    )),
                    Expanded(child: Container(color: Colors.brown,))
                  ],
                ))
              ],)),
            ],
          ))
        ],
      ),
    );
  }
}