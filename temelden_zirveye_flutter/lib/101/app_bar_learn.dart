import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarLearnView extends StatelessWidget {
  const AppBarLearnView({Key? key}) : super(key: key);

  final _title = 'App Bar Learn';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        leading: const Icon(Icons.chevron_left),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications_active_rounded))
        ],
        actionsIconTheme: const IconThemeData(color: Colors.green),
      ),
    );
  }
}
