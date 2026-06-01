import 'dart:convert';
import 'dart:math' hide log;
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../models/task.dart';

class TaskApiService {
  static const String baseUrl = "https://dummyjson.com";

  static Future<List<Task>> fetchTasks() async {
    final url = '$baseUrl/todos';

    log("Adres zapytania: $url", name: "TaskApiService");

    try {
      final response = await http.get(Uri.parse(url));

      log("Kod odpowiedzi HTTP: ${response.statusCode}", name: "TaskApiService");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final List todos = data["todos"];

        final random = Random();
        final priorities = ["niski", "średni", "wysoki"];
        final deadlines = ["dzisiaj", "jutro", "za tydzień", "w weekend"];

        final tasks = todos.map((todo) {
          final randomPriority = priorities[random.nextInt(priorities.length)];
          final randomDeadline = deadlines[random.nextInt(deadlines.length)];

          return Task(
            id: todo["id"],
            title: todo["todo"],
            deadline: randomDeadline,
            done: todo["completed"],
            priority: randomPriority,
          );
        }).toList();

        log("Liczba pobranych zadań: ${tasks.length}", name: "TaskApiService");

        return tasks;
      } else {
        final errorMsg = "Błąd pobierania danych, status inny niż 200";
        log(errorMsg, name: "TaskApiService", error: "Otrzymano status: ${response.statusCode}");
        throw Exception(errorMsg);
      }
    } catch (error) {
      log("Wystąpił wyjątek podczas łączenia z API", name: "TaskApiService", error: error);
      rethrow;
    }
  }
}