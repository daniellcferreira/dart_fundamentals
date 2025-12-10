import '../models/account.dart';

// Controlador responsável por gerenciar as operações bancárias
class BankController {
  // Banco de dados interno simulando armazenamento de contas
  // Cada conta é identificada por um ID (String)
  final Map<String, Account> _database = {};

  // Adiciona uma nova conta ao "banco de dados" interno
  void addAccount({required String id, required Account account}) {
    _database[id] = account;
  }

  // Realiza uma transferência entre duas contas
  // Retorna true caso a transferência seja concluída com sucesso
  // e false caso alguma validação falhe
  bool makeTransfer({
    required String idSender,
    required String idReceiver,
    required double amount,
  }) {
    // Verifica se o ID do remetente existe
    if (!verifyId(idSender)) {
      return false;
    }

    // Verifica se o ID do destinatário existe
    if (!verifyId(idReceiver)) {
      return false;
    }

    // Recupera as contas do remetente e do destinatário
    Account accountSender = _database[idSender]!;
    Account accountReceiver = _database[idReceiver]!;

    // Verifica se o remetente está autenticado
    if (!accountSender.isAuthenticated) {
      return false;
    }

    // Verifica se o remetente possui saldo suficiente
    if (accountSender.balance < amount) {
      return false;
    }

    // Efetua a transferência: debita do remetente e credita no destinatário
    accountSender.balance -= amount;
    accountReceiver.balance += amount;

    return true;
  }

  // Verifica se um determinado ID existe na base de dados
  bool verifyId(String id) {
    return _database.containsKey(id);
  }
}
