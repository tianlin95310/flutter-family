class A implements Comparable<A> {
  int? v;

  @override
  int compareTo(other) {
    return 0;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is A && runtimeType == other.runtimeType && v == other.v;

  @override
  int get hashCode => v.hashCode;
}

void main() {
  // A a = A();
  // A b = A();
  // print(a == b);
  // print(a.compareTo(b));
  fun1();
}

fun1() {
  String? str1 = null;
  String str2 = '123';
  String str3 = '123';
  String? str4;
  str4 ??= str2;

  print(str1 ??= (str4 ?? '456'));

  print(null.toString());

  print(str1 ?? str4 ?? str3);

  print(str2 == str3);
}
