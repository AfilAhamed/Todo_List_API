import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_api/controller/crud_controller.dart';
import 'package:todolist_api/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CrudController(),
        ),
       
      ],
      child: MaterialApp(
        title: 'ToDo List',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(centerTitle: true),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
