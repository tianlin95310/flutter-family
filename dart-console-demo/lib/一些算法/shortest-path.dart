import 'dart:collection';
import 'dart:math';

//最短路径算法
// https://zhuanlan.zhihu.com/p/33162490
final int maxValue = pow(2, 50).toInt();
void main() {
  List<List<int?>> a = createDatas(5);
  // floyd(createDatas(5), 5);
  dijkstra(a, 0, 5);
}

void dijkstra(List<List<int?>> map, int start, int n) {
  // 某点到其他点的距离
  List<int?> dist = List.filled(5, null);
  Set<int> visit = HashSet<int>();
  visit.add(start);
  for (int i = 0; i < n; i++) {
    dist[i] = map[start][i];
  }
  List<int> path = List.filled(n, -1);
  path[start] = start;

  // 从其他点
  while (visit.length < n) {
    int minValue = maxValue;
    int minIndex = 0;
    for (int i = 0; i < n; i++) {
      // 找到距离p点最短距离的点，更新距离和点
      if (!visit.contains(i) && dist[i]! < minValue) {
        minValue = dist[i]!;
        minIndex = i;
      }
    }
    // 更新dist的值，只有拆分路径小于之前的路径时更新，并将路径至path中
    for (int i = 0; i < n; i++) {
      if (!visit.contains(i)) {
        int temp = dist[minIndex]! + map[minIndex][i]!;
        if (dist[i]! > temp && map[minIndex][i]! != maxValue) {
          dist[i] = min(dist[i]!, temp);
          path[i] = minIndex;
        }
      }
    }
    visit.add(minIndex);
  }

  for (int i = 0; i < n; i++) {
    print('$start - $i = ${dist[i]}');
  }

  print('path = $path');
  for (int i = 0; i < n; i++) {
    if (dist[i] == maxValue) {
      continue;
    }
    List<int> s = [];
    int now = path[i];
    s.add(i);
    while(now != start && now != -1) {
      s.add(now);
      now = path[now];
    }
    s.add(start);
    print('s = $s');
  }
}

void floyd(List<List<int?>> a, int n) {
  for (int k = 0; k < n; k++) {
    for (int i = 0; i < n; i++) {
      for (int j = 0; j < n; j++) {
        // if (i == 0 && j == 4)
        print(
            '($k, $i, $j), a$i$j = ${a[i][j]}, a$i$k = ${a[i][k]}, a$k$j = ${a[k][j]}, a$i$k + a$k$j = ${a[i][k]! + a[k][j]!}');
        a[i][j] = min(a[i][j]!, a[i][k]! + a[k][j]!);
      }
    }
  }
  for (int i = 0; i < n; i++) {
    for (int j = i + 1; j < n; j++) {
      print('$i - $j : ${a[i][j]}');
    }
  }
}

List<List<int?>> createDatas(int n) {
  List<List<int?>> a = [
    List.filled(n, null),
    List.filled(n, null),
    List.filled(n, null),
    List.filled(n, null),
    List.filled(n, null)
  ];
  for (int i = 0; i < n; i++) {
    for (int j = 0; j < n; j++) {
      a[i][j] = maxValue;
    }
    a[i][i] = 0;
  }
  a[0][1] = 10;
  a[1][0] = 10;
  a[0][3] = 30;
  a[3][0] = 30;
  a[0][4] = 100;
  a[4][0] = 100;
  a[1][2] = 50;
  a[2][1] = 50;
  a[2][3] = 20;
  a[3][2] = 20;
  a[2][4] = 10;
  a[4][2] = 10;
  a[3][4] = 60;
  a[4][3] = 60;
  a.forEach((element) { print(element);});
  return a;
}
