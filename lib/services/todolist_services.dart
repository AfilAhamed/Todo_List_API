import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:todolist_api/model/todolist_model.dart';

class TodoListServices {
  //Post Method
  Future<String> postMethod(String title, String description) async {
    final body = {
      "title": title,
      "description": description,
    };
    const url = "https://api.nstack.in/v1/todos";
    final uri = Uri.parse(url);
    try {
      final response = await http.post(uri,
          body: jsonEncode(body),
          headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 201) {
        log('Post Method Sucessfull');
        final responseData = jsonDecode(response.body);
        String status = responseData["message"];
        return status;
      } else {
        log('Failed to Post :${response.statusCode}');
        final responseData = jsonDecode(response.body);
        String status = responseData["message"];
        return status;
      }
    } catch (error) {
      log(error.toString());
      return "Something Went Wrong";
    }
  }

  //Get Method
  Future<TodoListModel?> getMethod() async {
    const url = "https://api.nstack.in/v1/todos?page=1&limit=10";
    final uri = Uri.parse(url);

    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        log('Get Method is Succesfull');

        final jsonData = jsonDecode(response.body);

        final data = TodoListModel.fromJson(jsonData);

        return data;
      } else {
        log('failed to Get ${response.statusCode}');
        return null;
      }
    } catch (error) {
      log(error.toString());
      return null;
    }
  }

  //Delete Method
  Future<void> deleteMethod(String id) async {
    final url = "https://api.nstack.in/v1/todos/$id";
    final uri = Uri.parse(url);

    try {
       final response = await http.delete(uri);
      if (response.statusCode == 200) {
        log('deleted succesfuly');
      } else {
        log('failed to delete ${response.statusCode}');
      }
    } catch (error) {
      log(error.toString());
    }
  }

  //Update Method
  Future<void> updateMethod(String id, String title, String description) async {
    final  data = {
      "title": title,
      "description": description,
    };
    final url = "https://api.nstack.in/v1/todos/$id";
    final uri = Uri.parse(url);

    try {
       final response = await http.put(uri,
        body: jsonEncode(data), headers: {'Content-Type': 'application/json'});
      if (response.statusCode == 200) {
        log('updated succesfully');
      } else {
        log('failed update ${response.statusCode}');
      }
    } catch (error) {
      log(error.toString());
    }
  }
}
