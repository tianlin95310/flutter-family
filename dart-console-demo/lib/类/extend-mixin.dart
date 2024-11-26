mixin AAA {
  int value1 = 100;
  get value2 => 200;
}

class C1 with AAA {

}

class C2 extends C1 {

}
void main() {
  C2 c2 = C2();
  print('C2 value1 = ${c2.value1}, value2 = ${c2.value2}');
}