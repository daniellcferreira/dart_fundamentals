// Classe que representa uma conta bancária
class Account {
  // Nome do titular da conta
  String name;

  // Saldo atual da conta
  double balance;

  // Indica se a conta está autenticada no sistema
  bool isAuthenticated;

  // Construtor da classe Account
  // name e balance são obrigatórios, isAuthenticated é opcional (padrão = false)
  Account({
    required this.name,
    required this.balance,
    this.isAuthenticated = false,
  });

  // Método para editar o saldo da conta.
  // O parâmetro 'value' pode ser positivo (depósito) ou negativo (saque).
  void editBalance({required value}) {
    balance = balance + value;
  }
}
