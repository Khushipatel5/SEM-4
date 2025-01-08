import 'dart:io';

void main(){
  print("enter the string");
  String str=stdin.readLineSync()!;
  int length=str.length;
  int count=0;
  for(int i=length-1;i>0;i--){
    if(str[i]==" "){
      break;
    }
    else{
      count++;
    }
  }
  String str1="";
  for(int i=length-count;i<length;i++){
    str1=str1+str[i];
  }
  print(str1);
}