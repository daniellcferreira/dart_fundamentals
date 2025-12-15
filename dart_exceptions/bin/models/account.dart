// Classe que representa uma conta bancária
class Account {
  // Nome do titular da conta
  String name;

  // Saldo atual da conta
  double balance;

  // Indica se a conta está autenticada no sistema
  bool isAuthenticated;

  // Data de criação da conta (opcional)
  DateTime? createdAt;

  // Construtor da classe Account
  // Todos os campos principais são obrigatórios
  Account({
    required this.name,
    required this.balance,
    required this.isAuthenticated,
  });

  // Método responsável por alterar o saldo da conta
  // O valor pode ser positivo (crédito) ou negativo (débito)
  void editBalance({required value}) {
    balance = balance + value;
  }

  // Sobrescreve o método toString para exibir
  // informações formatadas da conta
  @override
  String toString() {
    return "Account from $name\n"
        "Balance: $balance\n"
        "Authenticated: $isAuthenticated\n"
        "Created at: $createdAt";
  }
}
