void main() {
  String str = '123';

  fun(str);
  print(str);
  print(fun);

  Test a = Test();
  a.name = 'fun1';
  fun2(a);
  print(a.toString());
}

//引用传递
fun(str) {
  str = '124';
}
//引用传递
fun2(Test b) {
  b.name = 'fun2';
}

class Test {
  String? name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Test &&
              runtimeType == other.runtimeType &&
              name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return name.toString();
  }
}