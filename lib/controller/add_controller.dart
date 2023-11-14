import 'package:flutter/material.dart';
import 'package:todolist_api/services/todolist_services.dart';

class AddScreenController extends ChangeNotifier {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  Future<void> fetchPostMethod() async {
    final String title = titleController.text;
    final String description = descriptionController.text;

    await TodoListServices().postMethod(title, description);

    notifyListeners();
  }
}
