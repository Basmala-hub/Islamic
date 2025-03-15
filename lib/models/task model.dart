class TaskModel {
  final String title;
  final String describtion;
  final int id;

  const TaskModel({
    required this.title,
    required this.id,
    required this.describtion,
  });

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
        title: map['title'] ?? "No Title",
        describtion: map['describtion'] ?? "No Description",
        id: map['id'] ?? 0);
  }
}
