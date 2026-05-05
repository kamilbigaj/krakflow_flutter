import 'dart:convert';

void main() {
  print('--- ZADANIE 1A ---');
  zadanie1A();

  print('\n--- ZADANIE 1B ---');
  zadanie1B();

  print('\n--- ZADANIE 1C ---');
  zadanie1C();
}

void zadanie1A() {
  String jsonText = '[1, 5, 8, 3, 2]';
  final List data = jsonDecode(jsonText);

  int suma = 0;
  for (int liczba in data) {
    suma += liczba;
  }

  print('Liczby: $data');
  print('Suma liczb z listy wynosi: $suma');
}

void zadanie1B() {
  String jsonText = '''
  {
    "group": "Dart",
    "students": ["Ola", "Adam", "Kasia"]
  }
  ''';

  final data = jsonDecode(jsonText);

  print('Grupa: ${data["group"]}');
  print('Studenci: ${data["students"]}');
}

void zadanie1C() {
  String jsonText = '''
  {
    "product": {
      "name": "Laptop",
      "price": 3500
    }
  }
  ''';

  final data = jsonDecode(jsonText);

  print('Nazwa produktu: ${data["product"]["name"]}');
  print('Cena produktu: ${data["product"]["price"]} PLN');
}