import 'dart:io';

void main() {
  print("enter a");
  double a = double.parse(stdin.readLineSync()!);
  print("enter b");
  double b = double.parse(stdin.readLineSync()!);
  print("enter c");
  double c = double.parse(stdin.readLineSync()!);
  print("enter d");
  double d = double.parse(stdin.readLineSync()!);
  print("enter e");
  double e = double.parse(stdin.readLineSync()!);
  double ans=(((a+b+c+d+e)/500)*100);
  print(ans);
  if(ans>70){
    print("distinction class");
  }
  else if(ans<=70 && ans>60){
    print("First class");
  }
  else if(ans<=60 && ans>45){
    print("Second class");
  }
  else if(ans<=45 && ans>35){
    print("pass class");
  }
  else{
    print("fail");
  }
}