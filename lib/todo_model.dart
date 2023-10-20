class Todo {
  final String title;
  final String description;
  final String id;

  Todo({
    required this.title,
    required this.description,
    required this.id,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'].toString(),
      description: json['description'].toString(),
      id: json['id'].toString(),
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'id': id,
      };
}
