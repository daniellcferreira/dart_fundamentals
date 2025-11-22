import 'package:anybank/anybank.dart' as anybank;

void main() {
  print('Bem-vindo ao AnyBank!');
  Conta conta = Conta('João Silva', 1500.00);
  Conta conta2 = Conta('Maria Oliveira', 2500.00);

  List<Conta> contas = <Conta>[conta, conta2];

  for (Conta conta in contas) {
    print('Titular: ${conta.titular}, Saldo: \$${conta.saldo}');
  }

  conta.saldo += 500.00;
  print('Após depósito, o saldo de ${conta.titular} é \$${conta.saldo}');
}

class Conta {
  String titular;
  double saldo;

  Conta(this.titular, this.saldo);
}
