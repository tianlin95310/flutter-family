void main() {
  String inner = '我是中国人我是中国人中国人';
  dividerByLength(inner, 5);
}

void dividerByLength(String inner, int length) {

  int intLength = inner.length ~/ length;
  bool isInt = (inner.length / length == inner.length ~/ length);

  List<String> dividers = [];
  for (int i = 0; i < intLength; i++) {
    dividers.add(inner.substring(length * i, length * (i + 1)));
  }
  if (!isInt) {
    dividers.add(inner.substring(intLength * length, inner.length));
  }
  String content = dividers.join('\n');
}