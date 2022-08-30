import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:temelden_zirveye_flutter/101/app_bar_learn.dart';
import 'package:temelden_zirveye_flutter/101/button_learn.dart';
import 'package:temelden_zirveye_flutter/101/container_sized_box_learn.dart';
import 'package:temelden_zirveye_flutter/101/icon_learn.dart';
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
      theme: ThemeData.dark().copyWith(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.light, // statusBar kısmını yönetme
          backgroundColor: Colors.red,
          elevation: 0,
        )
      ),
      home:  IconLearnView(),
    );
  }
}
