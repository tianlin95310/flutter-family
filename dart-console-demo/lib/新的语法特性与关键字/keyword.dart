void main() {
  try {
    testAssert();
  } on Exception catch (e) {
    print(e);
  } on Error catch(e) {
    testAssert();
  }
  finally {
  }
  // testAssert();
}

testAssert() {
  print('testAssert start ');
  assert(1 == 2);
  print('testAssert end ');
}

newFiledKeyword() {
  var b = B(123, DateTime(2000), DateTime(2022));
  print(b.a1?.name);
  print(b.b2);
  print(b.name);
  print(b);

  print(B.sf1);
  print(B.sf2);
}
class A {
  String name = '';

  /**
   * 可变参数可为空，所以需要？定义
   */
  A({String? name}) {
    name = name ?? 'haha';
  }

  void fun() {}
}

class B extends A {
  A? a1;

  // 显示定义了一个非空的变量,可延后初始化，使用它的话后面必须要初始化，否则会抛异常
  late String b2;

  // late显示定义了一个可以为空的变量,需延迟初始化的变量，如果不使用他的话，就可不必进行初始化
  late String? b3;

  num c3;

  // final变量必须要在构造块初始化
  final DateTime dateTime1;

  DateTime? dateTime11;

  // final 成员变量必须立即初始化或是在构造函数初始化，？可为空
  final DateTime? dateTime2;
//  对于final修饰的，必须显示的初始化为null或者其他值，不像dateTime11，他默认为null
  final DateTime? dateTime22 = null;

  // late定义的变量，如果没有使用，及时是final的也可不必进行初始化，late的优先级高于final
  late final DateTime dateTime3;

  // late定义的变量，dateTime4, dateTime5如果使用了，即使是可以为空的，不管有没有final修饰，也必须显示的进行初始化
  late final DateTime? dateTime4;
  late DateTime? dateTime5;

  // only static fields can be declared as const
  // const double d4;

  // late final可以延后初始化，但是必须要初始化，不初始化会报错
  static late final sf1;

  // static final定义sf2不立即初始化会爆异常，因为静态变量不支持延后初始化，加了late就可以
  static final sf2 = 1001;

  // const不能延后初始化，需立即初始化，不能与late复用，必须与static复用
  static const sc2 = 1000;
  // const sc3 = 2000;

  // 当const修饰类的构造函数时，它要求该类的所有成员都必须是final的。
  B(this.c3, this.dateTime1, this.dateTime2) : super(name: 'TianLin') {
    super.fun();
    b2 = 'Lin';

    const c1 = 111;
    final c2 = 222;

    // 使用sf1则需要初始化，不适用则不需要
    sf1 = 2000;

    // dateTime3如果定义时没有初始化，并且未使用过，则dateTime3可不必初始化
    // dateTime3 = null;

    dateTime4 = null;
    // dateTime4只能初始化一次
    // dateTime4 = DateTime(2023);
    dateTime5 = null;
    dateTime5 = DateTime(2023);

    // const 只能在定义是初始化
    // c1 = 11;
    // final 变量只能初始化一次，并且可延后初始化
    // c2 = 22;
  }

  @override
  String toString() {
    // without b3
    return 'B{'
        'a1: $a1, '
        'b2: $b2, '
        'c3: $c3, '
        'dateTime1: $dateTime1, '
        'dateTime11: $dateTime11, '
        'dateTime2: $dateTime2, '
        'dateTime22: $dateTime22, '
        'dateTime4: $dateTime4, '
        'dateTime5: $dateTime5, '
        '}';
  }
}
