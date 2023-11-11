import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.teal.shade400,
            title: Text(
              'HomeScreen',
              style:
                  TextStyle(fontWeight: FontWeight.w600, color: Colors.black87),
            )),
      ),
    );
  }
}
