import 'dart:io';

void main() {
  print("enter a ");
  int a = int.parse(stdin.readLineSync()!);
  bool flag=true;
  for (int i = 2; i <a; i++) {
    if(a%i==0){
      flag=false;
    }
  }
  if(flag==true){
    print("prime");
  }
  else{
    print("not prime");
  }

}