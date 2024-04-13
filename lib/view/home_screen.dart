import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todolist_api/controller/crud_controller.dart';
import 'package:todolist_api/view/add_screen.dart';
import 'package:todolist_api/view/edit_screen.dart';
import 'package:todolist_api/view/widget/snackbar.dart';

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
      body: Consumer<CrudController>(
        builder: (context, crudProvider, child) {
      
          return crudProvider.todoListModel == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    itemCount: crudProvider.todoListModel!.items.length,
                    itemBuilder: (context, index) {
                      final data = crudProvider.todoListModel!.items[index];
                      return Slidable(
                        endActionPane:
                            ActionPane(motion: const DrawerMotion(), children: [
                          SlidableAction(
                            icon: Icons.edit,
                            backgroundColor: Colors.blue,
                            onPressed: (context) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditScreen(
                                        title: data.title,
                                        description: data.description,
                                        id: data.id),
                                  ));
                            },
                          ),
                          SlidableAction(
                            icon: Icons.delete,
                            backgroundColor: Colors.red,
                            onPressed: (context) {
                              crudProvider
                                  .delete(data.id)
                                  .then((value) => crudProvider.get());
                              showSnackMessage(
                                  context, "Deleted SuccesFully", Colors.red);
                            },
                          )
                        ]),
                        child: Card(
                          color: Colors.grey.shade100,
                          child: ListTile(
                            leading: CircleAvatar(
                                backgroundColor: Colors.teal.shade400,
                                child: Text(
                                  '${index + 1}',
                                  style: const TextStyle(color: Colors.white),
                                )),
                            title: Text(data.title),
                            subtitle: Text(data.description),
                          ),
                        ),
                      );
                    },
                  ),
                );
        },
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
