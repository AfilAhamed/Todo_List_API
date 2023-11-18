import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:todolist_api/model/todolist_model.dart';

class TodoListServices {
  //Post Method

  Future<void> postMethod(String title, String description) async {
    final body = {
      "title": title,
      "description": description,
      "is_completed": false,
    };
    const url = "https://api.nstack.in/v1/todos";
    final uri = Uri.parse(url);
    final response = await http.post(uri,
        body: jsonEncode(body), headers: {'Content-Type': 'application/json'});
    try {
      if (response.statusCode == 201) {
        log('posting Sucessfull');
        log(response.body);
      } else {
        log('Failed to Post :${response.statusCode}');
      }
    } catch (error) {
      log(error.toString());
    }
  }

  //Get Method

  List<TodoModel> getItems = [];

  Future<void> getMethod() async {
    const url = "https://api.nstack.in/v1/todos?page=1&limit=10";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    try {
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);

        jsonData['items'].forEach((element) {
          if (element['title'] != null && element['description'] != null) {
            TodoModel todoModel = TodoModel(
                id: element['_id'],
                title: element['title'],
                description: element['description'],
                isCompleted: element['is_completed']);
            getItems.add(todoModel);
          }
        });
        log('getmethod Succesfull');
      } else {
        log('failed to get${response.statusCode}');
      }
    } catch (error) {
      log(error.toString());
    }
  }
  //Delete Method

  Future<void> deleteById(String id) async {
    final url = "https://api.nstack.in/v1/todos/$id";
    final uri = Uri.parse(url);

    final response = await http.delete(uri);

    try {
      if (response.statusCode == 200) {
        log('deletion succesful');
      } else {
        log('deletion failed${response.statusCode}');
      }
    } catch (error) {
      log(error.toString());
    }
  }

  //Update Method
  Future<void> updateMethod(String id, String title, String description) async {
    final url = "https://api.nstack.in/v1/todos/$id";
    final uri = Uri.parse(url);
    final Map<String, String> data = {
      "title": title,
      "description": description,
    };
    final response = await http.put(uri,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
    try {
      if (response.statusCode == 200) {
        log('update succesfull');
      } else {
        log('update failed${response.statusCode}');
      }
    } catch (error) {
      log(error.toString());
    }
  }
}
