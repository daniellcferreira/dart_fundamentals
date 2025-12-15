// Exceção lançada quando o ID do remetente não é encontrado no sistema
class SenderIdInvalidException implements Exception {
  // Identificador padrão da exceção
  static const String report = "SenderIdInvalidException";

  // ID do remetente informado
  String idSender;

  // Mensagem formatada da exceção
  late String message;

  // Construtor que monta a mensagem da exceção
  SenderIdInvalidException({required this.idSender}) {
    message = "$report\nID Sender: $idSender";
  }

  // Retorna a mensagem da exceção ao ser impressa
  @override
  String toString() {
    return message;
  }
}

// Exceção lançada quando o ID do destinatário não é encontrado no sistema
class ReceiverIdInvalidException implements Exception {
  // Identificador padrão da exceção
  static const String report = "ReceiverIdInvalidException";

  // ID do destinatário informado
  String idReceiver;

  // Mensagem formatada da exceção
  late String message;

  // Construtor que monta a mensagem da exceção
  ReceiverIdInvalidException({required this.idReceiver}) {
    message = "$report\nID Receiver: $idReceiver";
  }

  // Retorna a mensagem da exceção ao ser impressa
  @override
  String toString() {
    return message;
  }
}

// Exceção lançada quando o remetente não está autenticado
class SenderNotAuthenticatedException implements Exception {
  // Identificador padrão da exceção
  static const String report = "SenderNotAuthenticatedException";

  // ID do remetente
  String idSender;

  // Mensagem formatada da exceção
  late String message;

  // Construtor que monta a mensagem da exceção
  SenderNotAuthenticatedException({required this.idSender}) {
    message = "$report\nID Sender: $idSender";
  }

  // Retorna a mensagem da exceção ao ser impressa
  @override
  String toString() {
    return message;
  }
}

// Exceção lançada quando o destinatário não está autenticado
class ReceiverNotAuthenticatedException implements Exception {
  // Identificador padrão da exceção
  static const String report = "ReceiverNotAuthenticatedException";

  // ID do destinatário
  String idReceiver;

  // Mensagem formatada da exceção
  late String message;

  // Construtor que monta a mensagem da exceção
  ReceiverNotAuthenticatedException({required this.idReceiver}) {
    message = "$report\nID Sender: $idReceiver";
  }

  // Retorna a mensagem da exceção ao ser impressa
  @override
  String toString() {
    return message;
  }
}

// Exceção lançada quando o saldo do remetente é menor que o valor da transferência
class SenderBalanceLowerThanAmountException implements Exception {
  // Identificador padrão da exceção
  static const String report = "SenderBalanceLowerThanAmountException";

  // ID do remetente
  String idSender;

  // Saldo atual do remetente
  double balanceSender;

  // Valor que se tentou transferir
  double amount;

  // Mensagem formatada da exceção
  late String message;

  // Construtor que monta a mensagem detalhada da exceção
  SenderBalanceLowerThanAmountException({
    required this.idSender,
    required this.balanceSender,
    required this.amount,
  }) {
    message =
        "$report\nID Sender: $idSender\nBalance Sender: $balanceSender\nAmount: $amount";
  }

  // Retorna a mensagem da exceção ao ser impressa
  @override
  String toString() {
    return message;
  }
}
