import 'package:di_demo/inject/inject.dart';
import 'package:flutter/material.dart';
import 'package:di_demo/scene/counter_page/widget/counter_page_main.dart';

void main() {

  configureDependencies(Env.prod);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const counterPageMain = CounterPageMain();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: counterPageMain,
    );
  }
}
