import 'dart:io';

void main() {
  double numero1 = double.parse(stdin.readLineSync()!);
  double numero2 = double.parse(stdin.readLineSync()!);

  String operacao = stdin.readLineSync()!;

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

  switch (operacao) {
    case '+':
      soma();
      break;
    case '-':
      subtracao();
      break;
    case '*':
      multiplicacao();
      break;
    case '/':
      divisao();
      break;
    default:
      print('Operação inválida');
  }

}
