import 'dart:io';

void main(){
  print("enter a");
  int a=int.parse(stdin.readLineSync()!);
  print("enter b");
  int b=int.parse(stdin.readLineSync()!);
  print("enter operator");
  String op=stdin.readLineSync()!;
  switch(op){

    case '+':{
      stdout.write(a+b);
      break;
    }

    case '-':{
      stdout.write(a-b);
      break;
    }

    case '*':{
      stdout.write(a*b);
      break;
    }
    case '/':{
      stdout.write(a/b);
      break;
    }
    case '%':{
      stdout.write(a%b);
      break;
    }
    default:
      stdout.write("invalid");




  }

}