void main() {
//  print('Hello world: ${dart_demo_learn.calculate()}!');
//  Combie();
//   listAddFiled();
//   testReduce();
  testTwoDimen();
}

testTwoDimen() {
  List<List<int>> list = [[1,2,3],[4,5,6]];
  print(list.reduce((value, element) => value..addAll(element)));
}
testReduce() {
  List<int> list = <int>[1, 2, 3, 4];
  list.reduce((value, element) {
    print('value = $value, element = $element');
    return element;
  });
}

listAddFiled() {
  List list1 = [
    {'a': '111', 'b': '222'},
    {'a': '333', 'b': '444'},
  ];

  list1.forEach((item) {
    item['c'] = 'haha';
    item['d'] = item['b'];
  });

  print(list1);
}

remove() {
  List list = [
    {'title': 'CNY', 'tip': '1'},
    {
      'icon': 'images/ic_exchange_usa.png',
      'title': 'USD',
      'desc': '美元\$',
      'viewType': 1,
      'tip': '0.14',
      'value': '',
    },
    {'title': 'JPY', 'tip': '15.10'}
  ];

  list.removeAt(1);
  list.replaceRange(0, 1, [
    {'title': 'mod', 'tip': '1'}
  ]);

  print(list);
}

Combie() {
  List list = [1, 2];

//  将两个list合并成一个
  List list2 = [
    {'a': '1', 'b': 2},
    ...list
  ];

  print(list2);
}
