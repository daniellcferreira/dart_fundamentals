import 'dart:io';

void main() {
  double numero1 = double.parse(stdin.readLineSync()!);
  double numero2 = double.parse(stdin.readLineSync()!);

  void soma() {
    print(numero1 + numero2);
  }

  void subtracao() {
    print(numero1 - numero2);
  }

  void multiplicacao() {
    print(numero1 * numero2);
  }

  void divisao() {
    print(numero1 / numero2);
  }

  soma();
  subtracao();
  multiplicacao();
  divisao();
}
