void main() {
  A()..fun();
}

abstract class B {
  fun() {
    print('class B fun');
  }
  fun2();
}
mixin Test {
  var user = 'Test';
  fun2() {
    print('mixin Test fun2');
  }
  fun() {
    print('mixin Test fun');
  }
}

mixin Test2 implements B{
  var user = 'Test2';
  fun() {
    print('mixin Test2 fun');
  }
}

class A extends B with Test, Test2 {

  @override
  fun() {
    super.fun();
    print('class A fun');
    print(user);
  }
}
