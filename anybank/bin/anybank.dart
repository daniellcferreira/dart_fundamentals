import 'package:anybank/anybank.dart' as anybank;

void main() {
  print('Bem-vindo ao AnyBank!');
  Conta conta = Conta('João Silva', 1500.00);
  Conta conta2 = Conta('Maria Oliveira', 2500.00);

  List<Conta> contas = <Conta>[conta, conta2];

  for (Conta conta in contas) {
    print('Titular: ${conta.titular}, Saldo: \$${conta.saldo}');
  }

  conta.saldo = 500.00;
  print('Após depósito, o saldo de ${conta.titular} é \$${conta.saldo}');

  receber(conta2, 300.00);
  print('Após receber, o saldo de ${conta2.titular} é \$${conta2.saldo}');

  enviar(conta, 200.00);
  print('Após enviar, o saldo de ${conta.titular} é \$${conta.saldo}');
}

void receber(Conta conta, double valor) {
  conta.saldo += valor;
}

void enviar(Conta conta, double valor) {
  conta.saldo -= valor;
}

class Conta {
  String titular;
  double saldo;

  Conta(this.titular, this.saldo);
}
