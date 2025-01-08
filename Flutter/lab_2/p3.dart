import 'dart:io';

void main() {
  print("enter a");
  int a = int.parse(stdin.readLineSync()!);
  print("enter b");
  int b = int.parse(stdin.readLineSync()!);
  print("enter c");
  int c = int.parse(stdin.readLineSync()!);
  if(a>b){
    if(a>c){
      stdout.write(a);
    }
    else{
      stdout.write(b);
    }
  }
  else{
    if(b<c){
      stdout.write(c);}
    else{
      stdout.write(b);
    }
  }
}