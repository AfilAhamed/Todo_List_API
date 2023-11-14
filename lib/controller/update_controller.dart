import 'package:flutter/material.dart';

import '../services/todolist_services.dart';

class UpdateController extends ChangeNotifier {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  Future<void> update(String id) async {
    String title = titleController.text;
    String description = descriptionController.text;

    await TodoListServices().updateMethod(id, title, description);

    notifyListeners();
  }
}
