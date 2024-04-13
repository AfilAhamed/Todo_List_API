import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_api/controller/crud_controller.dart';
import 'package:todolist_api/view/widget/snackbar.dart';

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
    final updateProvider = Provider.of<CrudController>(context, listen: false);
    updateProvider.updateTitleController.text = widget.title;
    updateProvider.updateDescriptionController.text = widget.description;
    super.initState();
  }

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
        child: Consumer<CrudController>(
          builder: (context, crudProvider, child) {
            return Column(children: [
              TextFormField(
                  controller: crudProvider.updateTitleController,
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
                  controller: crudProvider.updateDescriptionController,
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
                  onPressed: () {
                    crudProvider
                        .update(widget.id).then((value) => Navigator.pop(context))
                        .then((value) => crudProvider.get());
                    // Navigator.pop(context);
                    showSnackMessage(
                        context, 'Updated Succesfully', Colors.blue);
                  },
                  child: const Text(
                    'Edit',
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
