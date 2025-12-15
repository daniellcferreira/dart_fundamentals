import 'dart:math';

import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';

// Função criada para demonstrar e testar conceitos de Null Safety no Dart
void testingNullSafety() {
  // Declara uma conta que pode ser nula
  Account? myAccount = Account(
    name: "Ricarth Lima",
    balance: 300,
    isAuthenticated: true,
  );

  // Gerador de números aleatórios
  Random rng = Random();

  // Define a data de criação apenas em alguns casos
  if (rng.nextInt(10) % 2 == 0) {
    myAccount.createdAt = DateTime.now();
  }

  // Exemplo que NÃO funciona pois createdAt pode ser nulo
  // print(myAccount.createdAt.day);

  // Exemplo que funciona, mas é má prática
  // O operador "!" força a execução e pode gerar erro em tempo de execução
  // print(myAccount.createdAt!.day);

  // Forma correta: validação explícita contra null
  if (myAccount.createdAt != null) {
    // Uso seguro do operador "?."
    print(myAccount.createdAt?.day);
  } else {
    print("Data Nula");
  }

  // Exemplo válido de encadeamento com operador "?."
  // Demonstra como evitar NullPointerException
  // print(myAccount?.createdAt?.day); // Pode gerar warning de Flow Analysis

  // Conta não inicializada (nula)
  Account? otherAccount;

  // Encadeamento seguro mesmo quando o objeto é completamente nulo
  print(otherAccount?.createdAt?.day);
}

void main() {
  // Executa o teste de Null Safety
  testingNullSafety();

  // Instancia o controlador bancário
  BankController bankController = BankController();

  // Conta de teste auxiliar
  Account testAccount = Account(name: "", balance: 0, isAuthenticated: true);

  // Adiciona a conta do Ricarth ao sistema
  bankController.addAccount(
    id: "Ricarth",
    account: Account(name: "Ricarth Lima", balance: 400, isAuthenticated: true),
  );

  // Adiciona a conta do Kako ao sistema
  bankController.addAccount(
    id: "Kako",
    account: Account(name: "Caio Couto", balance: 600, isAuthenticated: true),
  );

  // Executa uma transferência utilizando tratamento de exceções
  try {
    bankController.makeTransfer(
      idSender: "Kako",
      idReceiver: "Ricarth",
      amount: 200,
    );

    // Executado apenas se nenhuma exceção for lançada
    print("Transação concluída com sucesso");
  }
  // Captura exceções específicas de regras de negócio
  on SenderIdInvalidException catch (e) {
    print(e.message);
  } on ReceiverIdInvalidException catch (e) {
    print(e);
  } on SenderNotAuthenticatedException catch (e) {
    print(e);
  } on SenderBalanceLowerThanAmountException catch (e) {
    print(e);
  }
  // Captura qualquer erro não mapeado
  catch (e) {
    print("Erro desconhecido.");
  }
}
