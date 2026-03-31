class Task {
  final String title;
  final String deadline;
  final bool done;
  final String priority;

  Task({
    required this.title,
    required this.deadline,
    required this.done,
    required this.priority,
  });
}


class TaskRepository {
  static List<Task> tasks = [
    Task(title: "Zrobić pranie", deadline: "dzisiaj", done: true, priority: "wysoki"),
    Task(title: "Nauczyć się Fluttera", deadline: "jutro", done: false, priority: "wysoki"),
    Task(title: "Zjeść obiad", deadline: "14:00", done: true, priority: "średni"),
    Task(title: "Pójść na spacer", deadline: "wieczorem", done: false, priority: "niski"),
  ];
}