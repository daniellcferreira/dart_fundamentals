import 'dart:io'; 

// Função principal que inicia o programa
void main() {
  // Cria uma lista que armazenará todas as notas digitadas pelo usuário
  List<String> notas = <String>[];

  // Inicia o menu principal passando a lista de notas
  menu(notas);
}

// Função responsável por obter o comando digitado pelo usuário
String getComando() {
  // Exibe o menu de opções ao usuário
  print("Digite um comando: 1 - Adicionar nota, 2 - Listar notas, 3 - Sair");

  // Lista contendo os comandos válidos aceitos pelo sistema
  List<String> comandos = <String>["1", "2", "3"];

  // Variável que receberá a entrada digitada
  String? entrada = "";

  // Lê a entrada do usuário a partir do terminal
  entrada = stdin.readLineSync();

  // Verifica se a entrada é inválida ou não está entre os comandos reconhecidos
  if (entrada == null || !comandos.contains(entrada)) {
    print("Comando inválido");
    return getComando(); // Chama novamente até que um comando válido seja digitado
  }
  
  return entrada; // Retorna o comando validado
}

// Função responsável por adicionar uma nova nota na lista
List<String> adicionarNota(List<String> notas) {
  // Solicita ao usuário que escreva uma nota
  print("Escreva uma nota");

  // Lê a nota digitada
  String? nota = "";

  nota = stdin.readLineSync();

  // Verifica se a nota está vazia ou nula
  if (nota == null || nota.isEmpty) {
    print("Não é possivel adicionar uma nota vazia.");
    adicionarNota(notas); // Reexecuta a função para tentar novamente
  }

  // Adiciona a nota válida à lista
  notas.add(nota!);

  // Retorna a lista atualizada
  return notas;
}

// Função responsável por exibir todas as notas já registradas
void listarNotas(List<String> notas) {
  // Percorre toda a lista imprimindo cada nota
  for (var i = 0; i < notas.length; i++) {
    print(notas[i]);
  }
}

// Função que controla o fluxo do programa exibindo o menu e executando as ações
void menu(List<String> notas) {
  // Solicita ao usuário que escolha uma opção
  String comando = getComando();

  // Decide qual função executar com base no comando recebido
  switch (comando) {
    case "1":
      // Adiciona uma nova nota e retorna ao menu
      adicionarNota(notas);
      menu(notas);

    case "2":
      // Lista todas as notas e volta ao menu
      listarNotas(notas);
      menu(notas);

    case "3":
      // Encerra o programa
      print("Até breve");
  }
}
