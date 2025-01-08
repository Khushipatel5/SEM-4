import 'dart:io';

void main() {

  List<Map<String, Object>> dict = [
    {'mem1': Model(name: "khushi", age: 18, salary: 85000)},
    {'mem2': Model(name: "vanita", age: 18, salary: 84000)},
    {'mem3': Model(name: "dharvi", age: 18, salary: 86000)},
  ];
  print("enter name");
  String str = stdin.readLineSync()!;
  Model model=Model();

  for(int i=0;i<dict.length;i++) {
    Model m=dict[i][str] as Model;
    if(m.name==str){
        print(m.name);
        print(m.salary);
        print(m.age);
      }
    }

}

class Model {
  String? name;
  int? age;
  int? salary;


  Model({ name, age,salary}){
    this.name=name;
    this.age=age;
    this.salary=salary;
  }
}
