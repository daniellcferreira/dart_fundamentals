import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';

void main() {
  // Exemplos de uso de assert (comentados)
  // assert(3 > 4);
  // assert(3 > 4, "Que pena, 3 não é maior que 4");

  // Instancia o controlador bancário
  BankController bankController = BankController();

  // Conta de teste criada apenas para fins de validação/desenvolvimento
  Account testAccount = Account(name: "", balance: 0, isAuthenticated: true);

  // Adiciona a conta do Ricarth ao sistema
  bankController.addAccount(
    id: "Ricarth",
    account: Account(
      name: "Ricarth Lima",
      balance: 400,
      isAuthenticated: false, // Não autenticado para testes de exceção
    ),
  );

  // Adiciona a conta do Kako ao sistema
  bankController.addAccount(
    id: "Kako",
    account: Account(name: "Caio Couto", balance: 600, isAuthenticated: true),
  );

  // Tenta realizar uma transferência utilizando tratamento de exceções
  try {
    bankController.makeTransfer(
      idSender: "Kako",
      idReceiver: "Ricarth",
      amount: 200,
    );

    // Mensagem exibida caso nenhuma exceção seja lançada
    print("Transação concluída com sucesso");
  }
  // Captura exceção de ID do remetente inválido
  on SenderIdInvalidException catch (e) {
    print(e.message);
  }
  // Captura exceção de ID do destinatário inválido
  on ReceiverIdInvalidException catch (e) {
    print(e);
  }
  // Captura exceção de remetente não autenticado
  on SenderNotAuthenticatedException catch (e) {
    print(e);
  }
  // Captura exceção de destinatário não autenticado
  on ReceiverNotAuthenticatedException catch (e) {
    print(e);
  }
  // Captura exceção de saldo insuficiente
  on SenderBalanceLowerThanAmountException catch (e) {
    print(e);
  }
  // Captura qualquer erro não previsto
  catch (e) {
    print("Erro desconhecido.");
  }
}
