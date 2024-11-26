void main() {
  try {
    double d1 = double.parse('');
  } on FormatException catch (e) {
    print(e.toString());
    print(e.message);
    print('Exception');
  } on Error {
    print('Error');
  } on FormatException catch (e) {
    print(e);
  } on Exception {
    print('Exception');
  } finally {
    print('finally');
  }

  print('last ');
}

mathE() {
  try {
    double a = 1 / 0;
    print(a);
  } catch (e) {}
}
