import 'dart:io';

void main(){
  print("enter a");
  int a=int.parse(stdin.readLineSync()!);
  print("enter b");
  int b=int.parse(stdin.readLineSync()!);
  print("enter c");
  int c=int.parse(stdin.readLineSync()!);
  print("enter d");
  int d=int.parse(stdin.readLineSync()!);
  print("enter e");
  int e=int.parse(stdin.readLineSync()!);

  stdout.write(((a+b+c+d+e)/25)*100);
}