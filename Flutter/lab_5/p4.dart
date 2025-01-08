import 'dart:io';

void main(){
  List<Map<String,dynamic>> phonebook=[
    {
      "name":"khushi",
      "phoneno":56849544123
    }
    ,
    {
      "name":"vanita",
      "phoneno":4560154523
    }
    ,{
      "name":"dharvi",
      "phoneno":4410328844
    }
  ];
  int n=int.parse(stdin.readLineSync()!);
  print(phonebook[n]);
}