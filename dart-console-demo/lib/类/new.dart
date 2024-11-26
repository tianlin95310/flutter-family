void main() {
  testNew();
}

testNew() {
  NewClass c1 = NewClass.new();
  print(c1);

  c1.str = '123';
  print(c1);
  NewClass c2 = NewClass.new();
  print(c2);

  print(NewClass.new);
}

class NewClass {
  String? str;

  @override
  String toString() {
    return 'NewClass{str: $str}';
  }
}
