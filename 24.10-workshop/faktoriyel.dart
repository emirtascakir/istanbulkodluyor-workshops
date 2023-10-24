int faktoriyel(int n) {
  int sonuc = 1;
  for (int i = 1; i <= n; i++) {
    sonuc = sonuc * i;
  }
  return sonuc;
}

void main() {
  print(faktoriyel(6));
}
