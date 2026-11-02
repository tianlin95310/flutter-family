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

// ClassName(...)：未命名生成式构造函数
// ClassName.xxx(...)：命名生成式构造函数
// factory ClassName(...)：未命名工厂构造函数
// factory ClassName.xxx(...)：命名工厂构造函数
// const ClassName(...)：常量生成式构造函数
// ClassName.xxx(...) : this(...)：重定向构造函数
