import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormCopy extends StatefulWidget {
  FormCopy({super.key});

  @override
  State<FormCopy> createState() => _FormCopyState();
}

class _FormCopyState extends State<FormCopy> {
  var formKey=GlobalKey<FormState>();

  TextEditingController email=TextEditingController();

  TextEditingController number=TextEditingController();

  TextEditingController name=TextEditingController();

  bool flag=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Email and phone no form',textAlign: TextAlign.center,),),
      body:flag? Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage("https://marketplace.canva.com/EAFonk4pWlU/1/0/1600w/canva-pink-watercolor-floral-happy-birthday-greeting-card--CqQ5DJghe4.jpg"),
              fit: BoxFit.cover,
                opacity: 0.2,
              )
            ),

          ),
          Text(name.text)
        ],
      ):
      Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: 10,),
            TextFormField(
              controller: name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(10))

                  ),
                  hintText: "Enter Name",
                  labelText: 'Name'
              ),
              validator: (value) {
                if(value!.isEmpty){
                  return 'Enter name';
                }
                else if(!RegExp(r'^[a-z,A-Z]{1,100}$').hasMatch(value)){
                  return 'alphabets only';
                }
              },
            ),
            SizedBox(height: 15,),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.yellow
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(10)
                      )
                  ),
                  hintText: "Enter Email address",
                  labelText: 'Email Address'


              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'Please Enter your Email address';
                }
                else if(!RegExp(r'^[a-z,0-9,.,_]{1,50}@gmail.com$').hasMatch(value)){
                  return 'email not valid';
                }
              },
              controller: email,
            ),
            SizedBox(height:15),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(10))

                  ),
                  hintText: "Enter Mobile no",
                  labelText: 'mobile no'
              ),
              validator: (value){
                if(value!.isEmpty){
                  return 'Please Enter your Mobile No';
                }
                if(!RegExp(r'^[0-9]{10}$').hasMatch(value)){
                  return 'Digits only';
                }
              },
              controller: number,
            ),
            SizedBox(height: 15),

            ElevatedButton(onPressed: (){
              if(formKey.currentState!.validate()){
                print(email.text);
                print(number.text);
                setState(() {
                  flag=true;
                });

              }
              //Image.asset('assets/images/birthdatecardimage.webp');
            }, child: Text("SUBMIT")),
          ],
        ),
      ),
    );

  }
}
