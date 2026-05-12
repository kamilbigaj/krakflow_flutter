class Task {
  final int id;
  final String title;
  final String deadline;
  final String priority;
  bool done;

  Task({
    required this.id,
    required this.title,
    required this.deadline,
    required this.priority,
    required this.done,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "deadline": deadline,
      "priority": priority,
      "done": done,
    };
  }

  factory Task.fromMap(Map map) {
    return Task(
      id: map["id"],
      title: map["title"],
      deadline: map["deadline"],
      priority: map["priority"],
      done: map["done"],
    );
  }
}