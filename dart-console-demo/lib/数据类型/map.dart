import 'dart:collection';

void main() {
//  mapCombine();

  // combineIfNull();

  // hashmap();
  treeMap();
}

treeMap() {
  SplayTreeMap map = SplayTreeMap();
  map['aaa'] = 123;
  map['123'] = 'aaa';
  map['124'] = 'ccc';
  map['bbb'] = 'bbb';
  map['aab'] = 120;
  map['ccc'] = 125;
  print(map);
}

hashmap() {
  HashMap map = HashMap();
  map['aaa'] = 123;
  map['1'] = '1a';
  map['2'] = 'a1';
  map['3'] = '12';
  print(map);
}
combineIfNull() {
  Map? map;
  map = {};
  Map map2 = {'age': 22};

  Map map3 = {
    ...map,
    ...map2,
  };
  print(map3);
}

mapCombine() {
  Map map = {'name': '1'};

  Map map2 = {'age': 22};

  Map map3 = {
    ...map,
    ...map2,
  };
  print(map3);
}

listToMap() {
  Map map = {'name': '1'};

  // 将list数据转化为map
  List<int> list = [1, 2, 3];
  Map newMap = Map.fromEntries(list.map((i) => MapEntry(i, i)));
  print(newMap);
}
