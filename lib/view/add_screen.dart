import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_api/controller/add_controller.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addprovider = Provider.of<AddScreenController>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal.shade400,
        title: const Text(
          'AddScreen',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          TextFormField(
              controller: addprovider.titleController,
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
              controller: addprovider.descriptionController,
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
                addprovider.fetchPostMethod();
                Navigator.pop(context);
                addprovider.titleController.clear();
                addprovider.descriptionController.clear();
              },
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                ),
              ))
        ]),
      ),
    );
  }

  // void showSnackMessage(String message, Color color) {
  //   final snackBar = SnackBar(
  //     content: Text(message),
  //     backgroundColor: color,
  //   );
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     snackBar,
  //   );
  // }
}
