import 'dart:io';
void main(){
  print("enter principle");
  double p=double.parse(stdin.readLineSync()!);
  print("enter rate");
  double r=double.parse(stdin.readLineSync()!);
  print("enter time");
  double t=double.parse(stdin.readLineSync()!);
  simple_intrest(p, r, t);
}
void simple_intrest(double p,double r, double t){
  double si=(p*r*t)/100;
  print("simple intrest is =$si");
}