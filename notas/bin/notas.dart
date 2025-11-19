import 'dart:io'; 

// Função principal que inicia o programa
void main() {
  // Lista que armazenará as notas digitadas pelo usuário
  List<String> notas = <String>[];

  // Chama a função responsável por solicitar e validar o comando do usuário
  getComando();

  // Chama a função que adiciona uma nova nota à lista
  adicionarNota(notas);

  // Chama a função que lista todas as notas armazenadas
  listarNotas(notas);
}

// Função responsável por obter o comando digitado pelo usuário
String getComando() {
  // Exibe o menu de opções ao usuário
  print("Digite um comando: 1 - Acionar nota, 2 - Listar notas, 3 - Sair");

  // Lista contendo os comandos válidos
  List<String> comandos = <String>["1", "2", "3"];

  // Variável que receberá a entrada do usuário
  String? entrada = "";

  // Lê a entrada do usuário a partir do terminal
  entrada = stdin.readLineSync();

  // Verifica se a entrada é inválida ou não está entre os comandos aceitos
  if (entrada == null || !comandos.contains(entrada)) {
    print("Comando inválido");
    return getComando(); // Chama novamente a função até obter comando válido
  }
  
  return entrada; // Retorna o comando validado
}

// Função responsável por adicionar uma nova nota na lista
List<String> adicionarNota(List<String> notas) {
  // Solicita ao usuário que escreva uma nota
  print("Escreva uma nota");

  // Lê a nota digitada pelo usuário
  String? nota = "";

  nota = stdin.readLineSync();

  // Valida se a nota foi enviada vazia ou nula
  if (nota == null || nota.isEmpty) {
    print("Não é possivel adicionar uma nota vazia.");
    adicionarNota(notas); // Tenta novamente caso seja inválida
  }

  // Adiciona a nota válida à lista
  notas.add(nota!);

  // Retorna a lista com a nova nota incluída
  return notas;
}

// Função responsável por exibir todas as notas já cadastradas
void listarNotas(List<String> notas) {
  // Percorre a lista e imprime cada nota no terminal
  for (var i = 0; i < notas.length; i++) {
    print(notas[i]);
  }
}
