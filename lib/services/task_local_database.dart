import 'package:hive_ce/hive.dart';
import 'dart:developer';
import '../models/task.dart';

class TaskLocalDatabase {
  static Box get _box => Hive.box("tasks");

  static List<Task> getTasks() {
    return _box.values.map((item) {
      return Task.fromMap(Map<String, dynamic>.from(item));
    }).toList();
  }

  static Future<void> saveTasks(List<Task> tasks) async {
    await _box.clear();
    for (final task in tasks) {
      await _box.put(task.id, task.toMap());
    }
    log("Zapisano początkową listę zadań pobraną z API", name: "TaskLocalDatabase");
  }

  static Future<void> addTask(Task task) async {
    await _box.put(task.id, task.toMap());
    log("Dodano zadanie: ${task.title}", name: "TaskLocalDatabase");
  }

  static Future<void> updateTask(Task task) async {
    await _box.put(task.id, task.toMap());
    log("Edytowano / Zmieniono status zadania: ${task.title} (Gotowe: ${task.done})", name: "TaskLocalDatabase");
  }

  static Future<void> deleteTask(int id) async {
    await _box.delete(id);
    log("Usunięto pojedyncze zadanie o id: $id", name: "TaskLocalDatabase");
  }

  static Future<void> deleteAllTasks() async {
    await _box.clear();
    log("Usunięto wszystkie zadania (wyczyszczono bazę)", name: "TaskLocalDatabase");
  }

  static bool isEmpty() {
    return _box.isEmpty;
  }
}