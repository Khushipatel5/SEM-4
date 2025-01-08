import 'dart:io';

void main() {
  print("Enter string");
  int count = 0;
  String s = stdin.readLineSync()!;

  List<String> str = s.split(' ');

  for (int i = 0; i < str.length; i++) {
    count = 0;
    for (int j = 0; j < str.length; j++) {
      if (str[i] == str[j]) {
        count++;
      }
    }
    if (count > 0) {
      print("${str[i]}: {$count}");
      str[i] = '';
    }
  }

}
