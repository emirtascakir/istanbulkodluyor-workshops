import 'dart:math';

void main() {
  print(isArmstrong(407));
}

bool isArmstrong(int number) {
  var temp = number;
  var digitCount = number.toString().length.toDouble();
  var sum = 0.0;
  while (temp > 0) {
    var lastDigit = temp % 10.toDouble();
    sum = sum + pow(lastDigit, digitCount);
    temp = (temp / 10).toInt();
  }
  if (sum.toInt() == number) {
    return true;
  }
  return false;
}
