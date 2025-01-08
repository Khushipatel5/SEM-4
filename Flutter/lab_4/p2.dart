import 'dart:io';
import 'dart:math';

void main() {
  print("enter a");
  int a=int.parse(stdin.readLineSync()!);
  print("enter b");
  int b=int.parse(stdin.readLineSync()!);
  max_of_2(a,b);
}
void max_of_2(int a,int b){

  if(a>b){
    print("$a is max");
  }
  else{
    print("$b is max");
  }
}