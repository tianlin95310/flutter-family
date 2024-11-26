void main() {
  Node n1 = Node(1);
  Node n3 = Node(3);
  Node n5 = Node(5);

  Node n2 = Node(2);
  Node n4 = Node(4);
  Node n6 = Node(6);
  n1.next = n3;
  n3.next = n5;

  n2.next = n4;
  n4.next = n6;
  var res = combine(n1, n2);
  visit(n1);
  print('---');
  visit(n2);
  print('---');
  visit(res);
}

void visit(Node? p) {
  while (p != null) {
    print(p);
    p = p.next;
  }
}

Node combine(Node param1, Node param2) {
  Node? temp = param1;
  while (temp != null) {
    Node? temp2 = param2;
    Node? temp2Pre;
    while (temp2 != null) {
      if (temp.value <= temp2.value) {
        if (temp2 == param2) {
          var clone = Node(temp.value);
          clone.next = param2;
          param2 = clone;
        } else {
          var clone = Node(temp.value);
          if (temp2Pre != null) {
            temp2Pre.next = clone;
            clone.next = temp2;
          }
        }
        break;
      }
      if (temp2.next == null) {
        break;
      }
      temp2Pre = temp2;
      temp2 = temp2.next;
    }
    if (temp.next == null) {
      print('外层循环结束');
      break;
    }
    temp = temp.next;
  }
  return param2;
}

class Node {
  Node? next;
  int value;

  Node(this.value);

  @override
  String toString() {
    return value.toString();
  }
}
