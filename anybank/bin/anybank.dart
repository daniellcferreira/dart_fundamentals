import 'package:anybank/anybank.dart' as anybank;

void main() {
  List<String> contas = <String>['Conta1', 'Conta2', 'Conta3'];
  List<double> saldos = <double>[1000.0, 2500.5, 300.75];
}

class Conta {
  String titular;
  double saldo;

  Conta(this.titular, this.saldo);
}
