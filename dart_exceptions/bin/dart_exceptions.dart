import 'controllers/bank_controller.dart';
import 'models/account.dart';

void main() {
  // Criando o banco
  BankController bankController = BankController();

  // Criando contas
  bankController.addAccount(
    id: "Pedro",
    account: Account(name: "Pedro Alves", balance: 500, isAuthenticated: true),
  );
  bankController.addAccount(
    id: "Maria",
    account: Account(name: "Maria Silva", balance: 300, isAuthenticated: true),
  );

  // Fazendo trasnferências
  bool result = bankController.makeTransfer(
    idSender: "Pedro",
    idReceiver: "Maria",
    amount: 200,
  );

  print("Transferência realizada com sucesso: $result");
}
