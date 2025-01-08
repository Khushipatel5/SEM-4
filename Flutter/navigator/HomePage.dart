import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lab/navigator/AboutPage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var formKey=GlobalKey<FormState>();

  TextEditingController email=TextEditingController();

  TextEditingController number=TextEditingController();

  TextEditingController name=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('navigator'),),
      body:Column(
        children: [
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Aboutpage(name: name,)));
                    });
                  }
                  }
                  //Image.asset('assets/images/birthdatecardimage.webp');
                , child: Text("SUBMIT")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
