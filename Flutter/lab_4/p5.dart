import 'dart:io';

void main(){
  odd_even();
}
void odd_even(){
  print("enter array size");
  int n=int.parse(stdin.readLineSync()!);
  List <int> arr=[];
  for(int i=0;i<n;i++){
    arr.add(int.parse(stdin.readLineSync()!));
  }
  int odd=0,even=0;
  for(int i=0;i<arr.length;i++){
    if(arr[i]%2==0){
      even=even+ arr[i];
    }
    else{
      odd=odd+ arr[i];
    }
  }
  print("sum of odd=$odd");
  print("sum of even=$even");
}