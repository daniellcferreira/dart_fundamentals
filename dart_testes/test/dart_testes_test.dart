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
}
