import 'package:flutter/material.dart';
import 'package:tec/screens/mainscreen/post_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'home - 0 stack',
              style: TextStyle(fontSize: 28),
            ),
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PostScreen(),),),
                child: const Text('next'),),
            const Text('implenting fork and pr'),
            ElevatedButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PostScreen(),),),
                child: const Text('next'),)
          ],
        ),
      ),
    ),);
  }
}