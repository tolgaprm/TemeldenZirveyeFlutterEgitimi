import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {},
              style: ButtonStyle(backgroundColor:
                  MaterialStateProperty.resolveWith<Color>((states) {
                if (states.contains(MaterialState.pressed)) {
                  return Colors.green;
                }

                return Colors.red;
              })),
              child: Text(
                "TextButton",
                style: Theme.of(context).textTheme.subtitle1,
              )),
          const ElevatedButton(
              onPressed: null, child: Text('Elevated  Button')),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          OutlinedButton(
              style: OutlinedButton.styleFrom(backgroundColor: Colors.amber),
              onPressed: () {},
              child: const Text('Outlined Button')),
          InkWell(
              onTap: () {},
              child:
                  const Text('Inkwell ile ontap özelliği kazandırılımış Text')),
          OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.search),
              label: const Text('Search'))
        ],
      ),
    );
  }
}
