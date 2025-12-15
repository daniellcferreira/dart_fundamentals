import '../exceptions/bank_controller_exceptions.dart';
import '../models/account.dart';

// Controlador responsável por gerenciar contas bancárias e operações de transferência
class BankController {
  // Estrutura interna que simula um banco de dados em memória
  // A chave é o ID da conta e o valor é o objeto Account
  final Map<String, Account> _database = {};

  // Adiciona uma nova conta ao banco de dados
  void addAccount({required String id, required Account account}) {
    _database[id] = account;
  }

  // Realiza a transferência de valor entre duas contas
  // Retorna true caso a operação seja concluída com sucesso
  // Lança exceções específicas caso alguma regra de negócio seja violada
  bool makeTransfer({
    required String idSender,
    required String idReceiver,
    required double amount,
  }) {
    // Verifica se o ID do remetente existe
    if (!verifyId(idSender)) {
      throw SenderIdInvalidException(idSender: idSender);
    }

    // Verifica se o ID do destinatário existe
    if (!verifyId(idReceiver)) {
      throw ReceiverIdInvalidException(idReceiver: idReceiver);
    }

    // Recupera as contas do remetente e do destinatário
    Account accountSender = _database[idSender]!;
    Account accountReceiver = _database[idReceiver]!;

    // Verifica se o remetente está autenticado
    if (!accountSender.isAuthenticated) {
      throw SenderNotAuthenticatedException(idSender: idSender);
    }

    // Verifica se o remetente possui saldo suficiente para a transferência
    if (accountSender.balance < amount) {
      throw SenderBalanceLowerThanAmountException(
        idSender: idSender,
        balanceSender: accountSender.balance,
        amount: amount,
      );
    }

    // Caso todas as validações sejam atendidas, efetiva a transferência
    accountSender.balance -= amount;
    accountReceiver.balance += amount;

    return true;
  }

  // Verifica se um ID existe no banco de dados
  bool verifyId(String id) {
    return _database.containsKey(id);
  }
}
