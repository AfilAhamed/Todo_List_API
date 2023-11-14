import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todolist_api/controller/home_controller.dart';
import 'package:todolist_api/view/add_screen.dart';
import 'package:todolist_api/view/edit_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    final homeProvider =
        Provider.of<HomeScreenController>(context, listen: false);
    homeProvider.fetchgetMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeScreenController>(context);

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.teal.shade400,
          title: const Text(
            'HomeScreen',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
          )),
      body: homeProvider.todoList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                itemCount: homeProvider.todoList.length,
                itemBuilder: (context, index) {
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
                                    title: homeProvider.todoList[index].title
                                        .toString(),
                                    description: homeProvider
                                        .todoList[index].description
                                        .toString(),
                                    id: homeProvider.todoList[index].id
                                        .toString()),
                              ));
                        },
                      ),
                      SlidableAction(
                        icon: Icons.delete,
                        backgroundColor: Colors.red,
                        onPressed: (context) {
                          String itemId =
                              homeProvider.todoList[index].id.toString();
                          homeProvider.deleteById(itemId);
                          setState(() {
                            homeProvider.todoList.removeAt(index);
                          });
                          //  deleteById(items['_id']);
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
                        title:
                            Text(homeProvider.todoList[index].title.toString()),
                        subtitle: Text(homeProvider.todoList[index].description
                            .toString()),
                      ),
                    ),
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

  // Future<void> deleteById(String id) async {
  //   final url = "https://api.nstack.in/v1/todos/$id";
  //   final uri = Uri.parse(url);

  //   final response = await http.delete(uri);
  //   if (response.statusCode == 200) {
  //     // final filtered = data.where((element) => element['_id'] != id).toList();

  //   }
  // }
}
