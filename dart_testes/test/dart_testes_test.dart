import 'package:dart_testes/dart_testes.dart' as app;
import 'package:test/test.dart';

void main() {
  test('Calcula o valor do produto com desconto sem porcentagem', () {
    expect(app.calcularDesconto(1000, 150, false), 850);
  });

  test(
    'Calcula o valor do produto com desconto sem porcentagem passando valor do produto zero',
    () {
      expect(
        () => app.calcularDesconto(0, 150, false),
        throwsA(TypeMatcher<ArgumentError>()),
      );
    },
  );

  test('Calcula o valor do produto com desconto com porcentagem', () {
    expect(app.calcularDesconto(1000, 15, true), 850);
  });

  test('Calcula o valor do produto com desconto zerado com porcentagem', () {
    expect(
      () => app.calcularDesconto(1000, 0, true),
      throwsA(TypeMatcher<ArgumentError>()),
    );
  });

  group('Calcula o valor do produto com desconto', () {
    var valuesToTest = {
      {'valor': 1000, 'desconto': 150, 'percentual': false}: 850,
      {'valor': 1000, 'desconto': 15, 'percentual': true}: 850,
    };
    valuesToTest.forEach((values, expected) {
      test('Entrada:$values Esperado:$expected', () {
        expect(
          app.calcularDesconto(
            double.parse(values["valor"].toString()),
            double.parse(values["desconto"].toString()),
            (values["percentual"] == true),
          ),
          equals(expected),
        );
      });
    });
  });
}
