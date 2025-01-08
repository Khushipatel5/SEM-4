import 'dart:io';

void main() {
  print("enter a");
  int a = int.parse(stdin.readLineSync()!);
  print("enter b");
  int b = int.parse(stdin.readLineSync()!);
  print("enter c");
  int c = int.parse(stdin.readLineSync()!);
  int ans= (a>b)? ((a>c) ? a:c ):((b>c)? b:c);
  print(ans);
}