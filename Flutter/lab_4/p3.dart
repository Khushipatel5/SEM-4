import 'dart:io';

void main(){
  print("enter a");
  try{
  int a=int.parse(stdin.readLineSync()!);
  series(a: a);
  }
  catch(e){
    print("number is invalid");
  }
}
void series({int a=0}){
  if(a!=0){
    int sum=0,num1=0,num2=1;
    for(int i=0;i<a;i++){
      sum=num1+num2;
      num1=num2;
      num2=sum;
    }
    print("for $a total sum is $sum");
  }

}