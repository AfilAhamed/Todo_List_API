import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_api/controller/crud_controller.dart';
import 'package:todolist_api/view/widget/snackbar.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        child: Consumer<CrudController>(
          builder: (context, crudProvider, child) {
            return Column(children: [
              TextFormField(
                  controller: crudProvider.titleController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Colors.teal.shade400)),
                      hintText: 'Title',
                      border: const OutlineInputBorder())),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: crudProvider.descriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 8,
                  minLines: 4,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 3, color: Colors.teal.shade400)),
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
                  onPressed: () async {
                    String status = await crudProvider.post();
                    if (status == "success") {
                      crudProvider.get();
                      Navigator.pop(context);
                      showSnackMessage(
                          context, 'Added Succesfully', Colors.blue);
                    } else {
                      showSnackMessage(context, status, Colors.red);
                    }
                  },
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                    ),
                  ))
            ]);
          },
        ),
      ),
    );
  }
}
