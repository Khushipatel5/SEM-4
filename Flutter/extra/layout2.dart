import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LayoutTwo extends StatelessWidget {
  const LayoutTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LAYOUT 2",textAlign:TextAlign.center,),),
      body: Column(
        children: [
          Expanded(child: Row(
            children: [
            Expanded(child: Container(color: Colors.greenAccent,)),
            Expanded(child: Column(
              children: [
                Expanded(child: Row(
                  children: [
                    Expanded(child: Row(
                      children: [
                        Expanded(child: Container(color: Colors.grey,)),
                        Expanded(child: Container(color: Colors.purple,))
                      ],
                    ))
                  ],
                )),
                Expanded(child: Row(
                  children: [
                    Expanded(child: Row(
                      children: [
                        Expanded(child: Container(color: Colors.purpleAccent,)),
                        Expanded(child: Container(color: Colors.red,))
                      ],
                    ))
                  ],
                ))
              ],
            ))
          ],)),
          Expanded(child: Row(
            children: [
              Expanded(child: Column(
                children: [
                  Expanded(child: Container(color: Colors.white,))
                ],
              )),
              Expanded(child: Row(
                children: [
                  Expanded(child: Column(
                    children: [
                      Expanded(child: Column(children: [
                        Expanded(child: Container(color: Colors.green,))
                      ],)),
                      Expanded(child: Column(
                        children: [
                          Expanded(child: Container(color: Colors.red,))
                        ],
                      )),
                      Expanded(child: Column(children: [
                        Expanded(child: Container(color: Colors.grey,))
                      ],))
                    ],
                  )),
                  Expanded(child: Column(
                    children: [
                      Expanded(child: Column(
                        children: [
                          Expanded(child: Container(color: Colors.yellow,))
                        ],
                      )),
                      Expanded(child: Column(
                        children: [
                          Expanded(child: Container(color: Colors.brown,))
                        ],
                      )),
                      Expanded(child: Column(
                        children: [
                          Expanded(child: Container(color: Colors.orange,))
                        ],
                      ))
                    ],
                  )),
                  Expanded(child: Column(
                    children: [
                    Expanded(flex:3,child: Column(
                      children: [Expanded(child: Container(color: Colors.green,))],)),
                    Expanded(child: Column(
                      children: [
                        Expanded(child: Container(color: Colors.purple,))
                      ],
                    )),
                    Expanded(flex:3,child: Column(
                      children: [Expanded(child: Container(color: Colors.grey,))],
                    ))
                  ],))
                ],
              )),
              Expanded(child: Column(
                children: [
                  Expanded(child: Container(color: Colors.yellow,))
                ],
              ))
            ],
          )),
          Expanded(child: Row(
            children: [
              Expanded(child: Column(children: [
                Expanded(child: Container(color: Colors.brown,))
              ],)),
              Expanded(child: Column(
                children: [Expanded(child: Container(color: Colors.green,))],
              )),
              Expanded(child: Column(
                children: [
                  Expanded(child: Container(color: Colors.purple,))
                ],
              ))
            ],
          ))
        ],
      ),
    );

  }
}
