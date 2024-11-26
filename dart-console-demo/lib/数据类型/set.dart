import 'dart:collection';

void main() {
  // set1();
  // set2();
  // treeSet();
  treeSet2();
}

treeSet2() {
  SplayTreeSet treeSet  = SplayTreeSet();
  treeSet.add(Person(12));
  treeSet.add(Person(10));
  treeSet.add(Person(22));
  treeSet.add(Person(17));
  treeSet.add(16);
  print(treeSet);
}

class Person implements Comparable{
  int age;
  Person(this.age);

  @override
  String toString() {
    return 'Person{age: $age}';
  }

  @override
  int compareTo(other) {
    if (other is Person) {
      return other.age - this.age;
    } else if (other is int){
      return other - this.age;
    } else {
      return 0;
    }
  }

  @override
  int get hashCode => super.hashCode;
}
treeSet1() {
  SplayTreeSet treeSet  = SplayTreeSet();
  treeSet.add(18);
  treeSet.add(12);
  treeSet.add(15);
  treeSet.add('aaa');
  print(treeSet);
}

set2() {
  HashSet set = HashSet();
  set.add(1);
  set.add('tianlin');
  set.add('2');
  print(set);
}

set1() {
  Set set = {1};
  set.add('tian');
  set.add({});
  print(set);
  print(set.runtimeType);
  set.forEach(print);
}
