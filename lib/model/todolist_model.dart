class TodoListModel {
  int code;
  bool success;
  List<Item> items;

  TodoListModel({
    required this.code,
    required this.success,
    required this.items,
  });

  factory TodoListModel.fromJson(Map<String, dynamic> json) => TodoListModel(
        code: json["code"],
        success: json["success"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  String id;
  String title;
  String description;
  bool isCompleted;
  DateTime createdAt;
  DateTime updatedAt;

  Item({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        isCompleted: json["is_completed"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "description": description,
        "is_completed": isCompleted,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
