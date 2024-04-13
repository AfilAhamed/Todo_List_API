import 'package:flutter/material.dart';
import 'package:todolist_api/model/todolist_model.dart';
import 'package:todolist_api/services/todolist_services.dart';

class CrudController extends ChangeNotifier {
  CrudController() {
    get();
  }
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TodoListModel? todoListModel;
   TextEditingController updateTitleController = TextEditingController();
  TextEditingController updateDescriptionController = TextEditingController();

  // post method
  Future<String> post() async {
    String status = await TodoListServices()
        .postMethod(titleController.text, descriptionController.text);
    titleController.clear();
    descriptionController.clear();
    return status;
  }

  //get method
  Future<void> get() async {
    todoListModel = await TodoListServices().getMethod();
    notifyListeners();
  }

  //delete method
  Future<void> delete(String id) async {
    await TodoListServices().deleteMethod(id);
    notifyListeners();
  }

  //update method
  Future<void> update(id) async {
    await TodoListServices()
        .updateMethod(id, updateTitleController.text, updateDescriptionController.text);
   
    notifyListeners();
  }
}
