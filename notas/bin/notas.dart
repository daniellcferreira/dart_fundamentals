import 'dart:io'; 

// Função principal que inicia o programa
void main() {
  getComando(); // Chama a função responsável por ler e validar o comando
}

// Função responsável por obter o comando digitado pelo usuário
String getComando() {
  // Exibe o menu de opções ao usuário
  print("Digite um comando: 1 - Acionar nota, 2 - Listar notas, 3 - Sair");

  // Lista de comandos válidos
  List<String> comandos = <String>["1", "2", "3"];

  String? entrada = "";

  // Lê a entrada do usuário via terminal
  entrada = stdin.readLineSync();

  // Verifica se a entrada é nula ou inválida
  if (entrada == null || !comandos.contains(entrada)) {
    print("Comando inválido");
    return getComando(); // Chama novamente até receber um comando válido
  }
  
  return entrada; // Retorna o comando válido
}
