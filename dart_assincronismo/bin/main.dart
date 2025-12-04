import 'package:http/http.dart';
import 'dart:convert';

void main() {
  // print('Hello, Dart!');
  requestData();
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
}
