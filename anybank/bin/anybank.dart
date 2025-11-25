import 'package:anybank/anybank.dart' as anybank;
import 'package:anybank/conta.dart';

void main() {
  print('Bem-vindo ao AnyBank!');
  Conta contaMatheus = Conta('Matheus', 1500.00);
  Conta contaRoberta = Conta('Roberta', 2500.00);

  List<Conta> contas = <Conta>[contaMatheus, contaRoberta];

  for (Conta conta in contas) {
    conta.imprimirSaldo();
  }

  contaRoberta.receber(3000);
  contaMatheus.receber(5000);

  contaRoberta.enviar(1000);
  contaMatheus.enviar(2000);
}
