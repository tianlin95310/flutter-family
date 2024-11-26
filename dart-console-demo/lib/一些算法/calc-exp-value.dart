void main() {
  print(calcSimpleExp('100+50-50-10+30+'));
}

// 简单的表达式计算
String calcSimpleExp(String exp) {
  if (exp == null || exp == '') {
    return '0';
  }
  exp = exp.replaceFirst(RegExp('0\n'), '');
  double result = 0;

  List<String> sps = exp.split(RegExp('[\+,-]'));

  List<String> operate = [];
  for (int i = 0; i < exp.length; i++) {
    if (exp.codeUnitAt(i) == '+'.codeUnitAt(0)) {
      operate.add('+');
    }
    if (exp.codeUnitAt(i) == '-'.codeUnitAt(0)) {
      operate.add('-');
    }
  }

  print(operate);

  if (sps.length == 1) {
    return sps[0];
  } else {
    result = double.parse(sps[0]);
    for (int i = 1; i < sps.length; i++) {
      if (sps[i] == '') {
        continue;
      }
      if (operate[i - 1] == '+') {
        result += double.parse(sps[i]);
      } else if (operate[i - 1] == '-') {
        result -= double.parse(sps[i]);
      }
    }
  }

  return result.toString();
}
