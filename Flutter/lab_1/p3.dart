import 'dart:io';
void main(){
  print("enter a");
  double a=double.parse(stdin.readLineSync()!);
  stdout.write((a-32)*5/9);
  //(°F - 32) × 5/9
}