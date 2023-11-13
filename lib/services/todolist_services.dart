import 'dart:convert';
import 'package:http/http.dart' as http;

class TodoListServices {
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
    if (response.statusCode == 201) {
      print(response.body);
      // showSnackMessage("SuccesFully Added", Colors.blue);
    } else {
      //  showSnackMessage("Failed to Post", Colors.red);
      print('requst failed ');
    }
  }
}
