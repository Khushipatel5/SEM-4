import 'dart:io';

void main(){
  int a=int.parse(stdin.readLineSync()!);
  if((a%2==0||a%3==0||a%5==0)&&(a%7!=0)){
    print("ugly number");
  }
  else{
    print("not ugly number");
  }
}