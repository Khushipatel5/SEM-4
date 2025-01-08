import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  const Demo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("helloooo"),
      ),
      body: Text("TEXTT BODY IS HERE",style:TextStyle( fontSize: 56.5,color: Colors.blue
      ),),
      backgroundColor: Colors.yellow,
    );
  }
}
