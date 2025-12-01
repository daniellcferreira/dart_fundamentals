import 'package:anybank/conta.dart';

void main() {
  print('Bem-vindo ao AnyBank!');
  ContaCorrente contaPedro = ContaCorrente('Pedro', 3000.00);
  ContaPoupanca contaAna = ContaPoupanca('Ana', 4000.00);
  ContaEmpresa contaJoao = ContaEmpresa('João', 2000.00);
  ContaInvestimento contaMaria = ContaInvestimento('Maria', 2000.00);

  contaPedro.imprimirSaldo();
  contaPedro.enviar(500);
  contaPedro.receber(1500);

  contaAna.imprimirSaldo();
  contaAna.enviar(1000);
  contaAna.receber(2000);
  contaAna.calcularRendimento();

  contaJoao.enviar(1000);
  contaMaria.receber(1000);
}
