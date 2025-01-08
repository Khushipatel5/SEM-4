import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lab/navigator/HomePage.dart';

class Aboutpage extends StatelessWidget {
  var name;

  Aboutpage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("about page"),),
      body:
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage("https://marketplace.canva.com/EAFonk4pWlU/1/0/1600w/canva-pink-watercolor-floral-happy-birthday-greeting-card--CqQ5DJghe4.jpg"),
                      fit: BoxFit.cover,

                      opacity: 0.2,
                    )
                ),

              ),
              Text(name.text),

          Positioned(
            top: 300,
            left: 500,
            child: ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Homepage")
              ,),
          )

        ],
      ),
    );
  }
}
