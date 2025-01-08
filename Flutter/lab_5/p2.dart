import 'dart:io';

void main(){
  List<int> arr1=[];
  List<int> arr2=[];
  print("enter size of list 1");
  int n1=int.parse(stdin.readLineSync()!);
  print("enter size of list 2");
  int n2=int.parse(stdin.readLineSync()!);
  for(int i=0;i<n1;i++){
    arr1.add(int.parse(stdin.readLineSync()!));
  }
  for(int i=0;i<n2;i++){
    arr2.add(int.parse(stdin.readLineSync()!));
  }

  for(int i=0;i<n1;i++){
    for(int j=0;j<n2;j++){
      if(arr1[i]==arr2[j]){
        print(arr1[i]);
      }
    }
  }
}