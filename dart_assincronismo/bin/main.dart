import 'package:http/http.dart';
import 'package:dart_assincronismo/api_keys.dart';
import 'dart:convert';

void main() {
  // print('Hello, Dart!');
  // requestData();
  //requestDataAsync();
  sendDataAsync({
    "id": 4,
    "name": "Flutter",
    "last_name": "Dart",
    "balance": 2500.0
  });
}

requestData() {
  String url =
      "https://gist.githubusercontent.com/daniellcferreira/ddcbf1eeadd0b69bead25a1b158f2091/raw/fc8a14b9cb47622fa71c7801757940662943d02d/accounts.json";
  Future<Response> futureResponse = get(Uri.parse(url));
  print(futureResponse);
  futureResponse.then((Response response) {
    print(response.body);
    List<dynamic> listAccounts = json.decode(response.body);
    Map<String, dynamic> mapCarla = listAccounts.firstWhere(
      (element) => element['name'] == 'Carla',
    );
    print(mapCarla['balance']);
  });

  print("Ultima coisa a ser executada");
}

Future<List<dynamic>> requestDataAsync() async {
  String url =
      "https://gist.githubusercontent.com/daniellcferreira/ddcbf1eeadd0b69bead25a1b158f2091/raw/fc8a14b9cb47622fa71c7801757940662943d02d/accounts.json";
  Response response = await get(Uri.parse(url));
  return json.decode(response.body);
}

sendDataAsync(Map<String, dynamic> mapAccount) async {
  List<dynamic> listAccounts = await requestDataAsync();
  listAccounts.add(mapAccount);
  String content = json.encode(listAccounts);

  String url =
      "https://gist.githubusercontent.com/daniellcferreira/ddcbf1eeadd0b69bead25a1b158f2091/raw/fc8a14b9cb47622fa71c7801757940662943d02d/accounts.json";
  
  Response response = await put(
    Uri.parse(url),
    headers: {"Authorization": "Bearer $githubApiKey"},
    body: json.encode({
      "description": "accounts.json",
      "public": true,
      "files": {
        "accounts.json": {
          "content": content,
        }
      }
    }),
  );
  print(response.body);
}
