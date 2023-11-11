import 'package:flutter/material.dart';
import 'package:todolist_api/view/add_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal.shade400,
          title: const Text(
            'HomeScreen',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
          )),
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(children: []),
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
}
