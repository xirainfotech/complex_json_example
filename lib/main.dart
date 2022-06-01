import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/event_provider.dart';
import 'view/home_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => EventProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
