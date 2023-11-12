import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:todolist_api/view/add_screen.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List data = [];

  @override
  void initState() {
    getMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal.shade400,
          title: const Text(
            'HomeScreen',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
          )),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            final items = data[index] as Map;
            return ListTile(
              title: Text(items['title']),
              subtitle: Text(items['description']),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.teal.shade400,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddScreen(),
              ));
        },
        label: const Text('Create',
            style: TextStyle(color: Colors.white, fontSize: 20)),
        icon: const Icon(
          Icons.add,
          color: Colors.white,
          size: 29,
        ),
      ),
    );
  }

  Future<void> getMethod() async {
    const url = "https://api.nstack.in/v1/todos?page=1&limit=10";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final jsondata = jsonDecode(response.body) as Map;
      // print(jsondata);
      // print(response.body);
      final result = jsondata["items"] as List;
      print(result);
      setState(() {
        data = result;
      });
    }
  }
}
