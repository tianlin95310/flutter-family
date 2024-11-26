import 'dart:collection';

void main() {
 LinkedHashSet set = LinkedHashSet();

 linklist();
}

linklist() {
  LinkedList<Person> list = LinkedList();
  list.add(Person('tian'));
  list.add(Person('lin'));
  list.add(Person('learn'));
  list.forEach(print);

  list.addFirst(Person('hi '));
  list.forEach(print);
}

final class Person extends LinkedListEntry<Person>{
  String name;

  Person(this.name);

  @override
  String toString() {
    return 'Person{name: $name}';
  }
}