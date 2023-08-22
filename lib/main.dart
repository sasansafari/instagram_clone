import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tec/route/names.dart';
import 'package:tec/route/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (BuildContext context) {
            RepositoryProvider<Post>

        },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'instagram clone',
        initialRoute: Screens.root,
        routes: routes,
      ),
    );
  }
}


