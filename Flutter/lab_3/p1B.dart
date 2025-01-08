import 'dart:io';

void main(){
  print("enter array size");
  int n=int.parse(stdin.readLineSync()!);
  List <int> arr=[];
  for(int i=0;i<n;i++){
    arr.add(int.parse(stdin.readLineSync()!));
  }
  int count;
  for(int i=0;i<n;i++){
    count=0;
    for(int j=0;j<n;j++){
      if(arr[i]==arr[j]) {
        count+=1;
      }
    }
    if(count==1){
      print(arr[i]);
    }
  }
}