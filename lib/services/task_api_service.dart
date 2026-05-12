import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import '../models/task.dart';

class TaskApiService {
  static const String baseUrl = "https://dummyjson.com";

  static Future<List<Task>> fetchTasks() async {
    final response = await http.get(Uri.parse('$baseUrl/todos'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List todos = data["todos"];

      final random = Random();
      final priorities = ["niski", "średni", "wysoki"];
      final deadlines = ["dzisiaj", "jutro", "za tydzień", "w weekend"];

      return todos.map((todo) {
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
    } else {
      throw Exception("Błąd pobierania danych");
    }
  }
}