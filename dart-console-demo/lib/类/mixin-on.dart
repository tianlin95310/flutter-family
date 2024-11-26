void main() {
  AClass().fun();
  BClass().fun();

  BClass b = BClass();
  print(b is AClass);
  print(b is A);
  print(b is B);
  print(b is C);
  print(b is Man);
}

mixin A {
  fun() {
    print('A');
  }
}
mixin B on Man {
  fun() {
    print('B');
  }
}

abstract class Man {
  say();
}
// on 限制混入B时需要AClass继承的类C需要实现或继承Man

// abstract class C extends Man{
//   fun();
// }
abstract class C implements Man {
  fun();
}

abstract class DClass {
  fun();
  funD();
}

// dart只能单继承extends只能接一个，可以implements多个
class AClass extends C with A, B implements Man, DClass {
  @override
  say() {}

  @override
  funD() {
    throw UnimplementedError();
  }
}

// dart只能单继承extends只能接一个
class BClass extends C with B, A, B, A implements Man {
  @override
  say() {}
}
