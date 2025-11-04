import 'dart:io';

void main() {
  double numero1 = 0;
  double numero2 = 0;

  String operacao = "";

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

  String? entrada = stdin.readLineSync();
  if (entrada != null) {
    if (entrada != "") {
      numero1 = double.parse(entrada);
    }
  }

  entrada = stdin.readLineSync();
  if (entrada != null) {
    if (entrada != "") {
      numero2 = double.parse(entrada);
    }
  }
  
  entrada = stdin.readLineSync();
  if (entrada != null) {
    operacao = entrada;
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
