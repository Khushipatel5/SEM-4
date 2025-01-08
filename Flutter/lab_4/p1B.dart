import 'dart:io';

void main(){
  height_sort();
}
void height_sort(){
  print("enter the sie of array");
  int n=int.parse(stdin.readLineSync()!);
  List<int> height=[];
  List<String> name=[];
  for(int i=0;i<n;i++){
    print("enter name");
    name.add(stdin.readLineSync()!);
    print("enter height");
    height.add(int.parse(stdin.readLineSync()!));
  }
  int tempnum;
  String tempname;
  for(int i=0;i<n;i++) {
    for (int j = i + 1; j < n; j++) {
      if (height[i] < height[j]) {
        tempnum = height[i];
        height[i] = height[j];
        height[j] = tempnum;

        tempname = name[i];
        name[i] = name[j];
        name[j] = tempname;
      }


    }
  }
  for (int i = 0; i < n; i++) {

    print("name:${name[i]} ||| height:${height[i]}");
  }
}