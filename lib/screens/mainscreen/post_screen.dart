import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Container(
          color: Colors.blue,
          child: const Text('home - 1 stack - PostScreen',style: TextStyle( fontSize: 28),),),
      ),
    ),);
  }
}
