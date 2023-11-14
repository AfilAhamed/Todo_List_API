import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_api/controller/home_controller.dart';
import 'package:todolist_api/controller/update_controller.dart';

class EditScreen extends StatefulWidget {
  const EditScreen(
      {super.key,
      required this.title,
      required this.description,
      required this.id});
  final String id;
  final String title;
  final String description;

  @override
  State<EditScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<EditScreen> {
  @override
  void initState() {
    final updateProvider =
        Provider.of<UpdateController>(context, listen: false);
    updateProvider.titleController.text = widget.title;
    updateProvider.descriptionController.text = widget.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final updateProvider = Provider.of<UpdateController>(context);
    final homeProvider = Provider.of<HomeScreenController>(context);

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
              controller: updateProvider.titleController,
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
              controller: updateProvider.descriptionController,
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
                updateProvider.update(widget.id);
                homeProvider.fetchgetMethod();
                Navigator.pop(context);
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
