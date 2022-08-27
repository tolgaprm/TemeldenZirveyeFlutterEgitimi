import 'package:flutter/material.dart';
import 'package:temelden_zirveye_flutter/101/container_sized_box_learn.dart';
import 'package:temelden_zirveye_flutter/101/scaffold_learn.dart';
import 'package:temelden_zirveye_flutter/101/text_learn_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: const ScaffoldLearn(),
    );
  }
}
