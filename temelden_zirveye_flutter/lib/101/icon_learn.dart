import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
  IconLearnView({Key? key}) : super(key: key);

  final iconSizes = IconSizes();
  final iconColors = IconColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      appBar: AppBar(
        title: const Text('Icon Learn'),
      ),
      body: Column(children: [
        IconButton(
            onPressed: (() {}),
            icon: Icon(
              Icons.favorite_border_outlined,
              size: iconSizes.iconSmall,
              color: iconColors.froly,
            )),
        IconButton(
            onPressed: (() {}),
            icon: Icon(
              Icons.favorite_border_outlined,
              size: iconSizes.iconSmall,
              color: iconColors.froly,
            )),
        IconButton(
            onPressed: (() {}),
            icon: Icon(
              Icons.favorite_border_outlined,
              size: iconSizes.iconSmall,
              color: iconColors.froly,
            )),
      ]),
    );
  }
}

class IconSizes {
  final double iconSmall = 40;
}

class IconColors {
  final Color froly = const Color(0xFFED617A);
}
