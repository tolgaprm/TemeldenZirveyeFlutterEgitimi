import 'package:flutter/material.dart';

class ContainerSizedBox extends StatelessWidget {
  const ContainerSizedBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            width: 200,
            child: Text('a' * 500),
          ),
          const SizedBox.shrink(),
          SizedBox.square(
            dimension: 100,
            child: Text("100" * 30),
          ),
          Container(
            height: 50,
            constraints: const BoxConstraints(maxWidth: 150, minWidth: 50),
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.all(10),
            decoration: ProjectUtility.boxDecoration,
            child: const Text('Flutter'),
          )
        ],
      ),
    );
  }
}

class ProjectUtility {
  static BoxDecoration boxDecoration = const BoxDecoration( 
      color: Colors.indigo,
      shape: BoxShape.circle,
      gradient: LinearGradient(colors: [Colors.blue, Colors.yellow]),
      boxShadow: [
        BoxShadow(color: Colors.blue, blurRadius: 10, offset: Offset(0.2, 1))
      ]);
}

class ProjectConteinerDecoration extends BoxDecoration {
  const ProjectConteinerDecoration() : super();
}
