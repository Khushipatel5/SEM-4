import 'dart:io';

void main(){
  List<int> arr=[];
  print("enter size of array");
  int n=int.parse(stdin.readLineSync()!);
  for(int i=0;i<n;i++){
    print("enter element {$i}");
    arr.add(int.parse(stdin.readLineSync()!));
  }
  int sum=0;
  for(int i=0;i<n;i++){
    if(arr[i]%3==0 || arr[i]%5==0){
      sum=sum+arr[i];
    }
  }
  print(sum);
}