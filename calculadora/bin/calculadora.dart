import 'dart:io';

void main() {
  double numero1 = 0;
  double numero2 = 0;
  String operacao = "";
  String? entrada = "";
  List<String> operacoes = <String>["+", "-", "*", "/"];

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

  void calcular() {
    switch (operacao) {
      case "+":
        soma();
        break;
      case "-":
        subtracao();
        break;
      case "*":
        multiplicacao();
        break;
      case "/":
        divisao();
        break;
      default:
        print("Operação inválida");
    }
  }

  print('Digite o primeiro número:');
  entrada = stdin.readLineSync();
  if (entrada != null) {
    if (entrada != "") {
      numero1 = double.parse(entrada);
    }
  }

  void getOperacao() {
    print('Digite a operação: ${operacoes.toString()}:');
    String? entrada = stdin.readLineSync();
    if (entrada != null) {
      if (operacoes.contains(entrada)) {
        operacao = entrada;
      } else {
        print('Operação inválida. Tente novamente.');
        getOperacao();
      }
    }
  }

  getOperacao();

  print('Digite o segundo número:');
  entrada = stdin.readLineSync();
  if (entrada != null) {
    if (entrada != "") {
      numero2 = double.parse(entrada);
    }
  }

  print("O resultado é:");

  calcular();
}
