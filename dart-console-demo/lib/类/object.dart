void main() {
//  objectClone();
//   objectCloneUseApi();
//  testIs();
//   testAnnl();

  // testFunctionField();
}

testFunctionField() {
  A a = A();
  print('funa = ${a.funa.runtimeType}, funb = ${a.funb.runtimeType}');
  a.something1((fun) {
    print('something1 = $fun');
  });
  a.something2((int fun) {
    print('something2 = $fun');
    return 'String';
  });
}

class A {
  dynamic name;
  // 这种函数变量定义了函数的返回值，不能返回其他类型的值
  void Function()? funa = () {
    return;
  };
  // 这种函数变量返回的类型未定
  Function? funb = () {
    return 1;
  };
  @override
  String toString() {
    return name.toString();
  }

  something1(void Function(int p1) onDo) {
    print('something1 onDo = $onDo, onDo.runtimeType = ${onDo.runtimeType}');
    onDo.call(10);
    onDo(11);
  }

  something2(Function? onDo) {
    print('something2 onDo = $onDo, onDo.runtimeType = ${onDo.runtimeType}');
    onDo?.call(100);
    onDo!(101);
  }
}

objectCloneUseApi() {
  var a = {'a': '1', 'b': 2};

  var b = Map.castFrom(a); // 改的是A
  b['a'] = 'cloneb';

  var c = Map.from(a);
  c['a'] = 'clonec';

  var d = Map.of(a);
  d['a'] = 'cloned';

  var e = Map.unmodifiable(a);
  // e['a'] = 'clonee';
  print(a);
  print(b);
  print(c);
  print(d);
  print(e);
}

objectClone() {
  A a1 = A();
  a1.name = 'qwe';
  print(a1);

  A a2 = a1;
  a2.name = 123;
  print(a1);

  var a3 = {a1}; // 无法克隆，失败

  print(a3.toSet());
  print(a3.toList(growable: false));
  print(a3.toList(growable: true));
  print(a3.toString());

  print(a3 is Set); // true
  print(a3 is Map);
  print(a3 is Object);

  // set.elementAt
  var a4 = {a1}.elementAt(0);
  a4.name = 'clone';

  print(a1);
  print(a4);
}

testIs() {
  var str = {};
  print(str is Map);
  print(str is Object);
  print(main is Object);
  print(main is Map);
}

testAnnl() {
  var a = {'a': '1'};
  print(a);
  print({a});
  print({a} is Map);
  print({a} is Object);
  print({...a});
  print({...a} is Map);
  print({...a} is Function);

  print('----------------');

  var b = [1, 2, 3];
  print({...b});
  print({b} is Map);
  print({...b} is Map);
  print('----------------');

  var c = [a];
  print({...c});
  print(c is Map);
  print({...c} is Map);
}
