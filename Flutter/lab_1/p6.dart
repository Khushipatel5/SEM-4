import 'dart:io';

void main(){
  stdout.write("enter weight in kg");
  double weight=double.parse(stdin.readLineSync()!);
  stdout.write("enter height in meter");
  double height=double.parse(stdin.readLineSync()!);
  double bmi=weight/(height*height);
  print("bmi=$bmi");
}