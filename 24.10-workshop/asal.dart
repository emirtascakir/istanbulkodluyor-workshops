import 'dart:math';

List<int> asalSayilar(int n) {
  List<int> asallar = [];
  for (int i = 2; i <= n; i++) {
    bool asalMi = true;
    for (int j = 2; pow(j, 2) <= i; j++) {
      if (i % j == 0) {
        asalMi = false;
        break;
      }
    }
    if (asalMi) {
      asallar.add(i);
    }
  }
  return asallar;
}

void main() {
  List<int> asallar = asalSayilar(100);
  print(asallar);
}
