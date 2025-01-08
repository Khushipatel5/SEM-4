void main(){
  List<String> list=['Delhi', 'Mumbai', 'Bangalore', 'Hyderabad','Ahmedabad'];
  int n=list.indexOf('Ahmedabad');
  list[n]='Surat';
  print(list);
}