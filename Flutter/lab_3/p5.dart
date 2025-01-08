import 'dart:io';

void main(){
  print("enter string");
  String a= stdin.readLineSync()!;
  String ans="";
  int length=a.length;
  for(int i=length-1;i>=0;i--){
    ans=ans+ a[i];
  }
  print(ans);
}