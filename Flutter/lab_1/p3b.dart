import 'dart:io';

void main(){
  print("enter start");
  int a = int.parse(stdin.readLineSync()!);
  print("enter end ");
  int b = int.parse(stdin.readLineSync()!);

  while(a <= b){
    bool flag = true;
    for(int i = 2; i <= a / 2; i++){
      if(a % i == 0){
        flag = false;
        break;
      }
    }
    if(flag && a > 1){
      print(a);
    }
    a++;
  }
}
