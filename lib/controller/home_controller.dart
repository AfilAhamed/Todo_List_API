import 'package:flutter/material.dart';
import 'package:todolist_api/model/todolist_model.dart';
import 'package:todolist_api/services/todolist_services.dart';

class HomeScreenController extends ChangeNotifier {
  List<TodoModel> todoList = <TodoModel>[];
  TodoListServices todoListServices = TodoListServices();

  Future<void> fetchgetMethod() async {
    await todoListServices.getMethod();

    // Filter out duplicates before updating the local list
    List<TodoModel> newItems = todoListServices.getItems.toSet().toList();
    List<TodoModel> uniqueItems = [];

    for (var newItem in newItems) {
      bool alreadyExists =
          todoList.any((existingItem) => existingItem.id == newItem.id);
      if (!alreadyExists) {
        uniqueItems.add(newItem);
      }
    }

    todoList.addAll(uniqueItems);

    notifyListeners();
  }

//Delete Method
  Future<void> deleteById(String id) async {
    await todoListServices.deleteById(id);
    notifyListeners();
  }
}
