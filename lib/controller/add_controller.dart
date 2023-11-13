import 'package:flutter/material.dart';
import 'package:todolist_api/services/todolist_services.dart';

class AddScreenController extends ChangeNotifier {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  Future<void> fetchPostMethod() async {
    final title = titleController.text;
    final description = descriptionController.text;

    TodoListServices newsServices = TodoListServices();
    await newsServices.postMethod(title, description);

    notifyListeners();
  }
}
