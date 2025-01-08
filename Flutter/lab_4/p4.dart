import 'dart:io';

void main(){
  print("enter number");
  int num=int.parse(stdin.readLineSync()!);
  int ans= check(num);
  print(ans);
}
int check(int num){
  bool flag=true;
  for(int i=2;i<num;i++){
    if(num % i==0){
      flag=false;
    }
  }
  if(flag==true){
    return 1;
  }
  else{
    return 0;
  }
}