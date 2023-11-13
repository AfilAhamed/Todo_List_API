import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<EditScreen> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal.shade400,
        title: const Text(
          'EditScreen',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: Colors.teal.shade400)),
                  hintText: 'Title',
                  border: const OutlineInputBorder())),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
              controller: descriptionController,
              keyboardType: TextInputType.multiline,
              maxLines: 8,
              minLines: 4,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: Colors.teal.shade400)),
                  hintText: 'Description',
                  border: const OutlineInputBorder())),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  backgroundColor: Colors.teal.shade400),
              onPressed: () {
                //  postMethod();
              },
              child: const Text(
                'Edit',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                ),
              ))
        ]),
      ),
    );
  }
}
