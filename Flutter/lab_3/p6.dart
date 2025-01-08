import 'dart:io';

void main() {
  int a = 1,
      sume = 0,
      sumo = 0;
  while (a != 0) {
    print("enter number");
    a = int.parse(stdin.readLineSync()!);
    if (a % 2 == 0 && a > 0) {
      sume = sume + a;
    }
    if (a % 2 != 0 && a < 0) {
      sumo = sumo + a;
    }
  }
  print("sum of even= $sume");
  print("sum of odd= $sumo");
}