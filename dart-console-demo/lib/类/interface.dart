// 只允许实现、不允许继承
interface class A {
  funA(){
    print('funA');
  }
}
// 只允许实现、不允许继承
abstract interface class B {
  void funB1();
  
  void funB2(){
    print('funB2');
  }
}

// 只允许继承、不允许实现
base class C {

}

// funA也必须实现
class D implements A, B {

  @override
  void funB1() {
  }

  @override
  void funB2() {
  }

}