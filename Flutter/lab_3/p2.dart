import 'dart:io';

void main() {
  print("enter a ");
  int a = int.parse(stdin.readLineSync()!);
  int ans = 1;
  for (int i = a; i > 0; i--) {
    ans = ans * i;
  }
  print(ans);
}