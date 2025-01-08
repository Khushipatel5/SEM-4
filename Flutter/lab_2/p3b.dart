
import 'dart:io';

void main(){
  print("enter the size of array");
  int n=int.parse(stdin.readLineSync()!);
  List<int> arr=[];
  for(int i=0;i<n;i++){
    arr.add(int.parse(stdin.readLineSync()!));
  }
  int count0=0;
  for(int i=0;i<n;i++){
    if(arr[0]==arr[i]){
      count0++;
    }
  }

}