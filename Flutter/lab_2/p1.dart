import "dart:io";
void main(){
  print("enter a");
  int a=int.parse(stdin.readLineSync()!);
  if(a>0){
    stdout.write("positive");
  }
  else{
    stdout.write("negative");
  }
}