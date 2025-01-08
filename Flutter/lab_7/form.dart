import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormOne extends StatelessWidget {
   FormOne({super.key});
  var formKey=GlobalKey<FormState>();
  TextEditingController email=TextEditingController();
  TextEditingController number=TextEditingController();

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Email and phone no form',textAlign: TextAlign.center,),),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            SizedBox(height: 10,),
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
                else if(value.length!=10){
                  return 'enter valid mobile no';
                }
              },
              controller: number,
            ),
            SizedBox(height: 10),

            ElevatedButton(onPressed: (){
              if(formKey.currentState!.validate()){
                print(email.text);
                print(number.text);
              }
            }, child: Text("SUBMIT")),
          ],
        ),
      ),
    );

  }
}
