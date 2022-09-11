import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/repository/ogretmenler_repository.dart';

class OgretmenlerSayfasi extends ConsumerWidget {

  const OgretmenlerSayfasi({Key? key})
      : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ogretmenlerRepository = ref.watch(ogretmenProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Öğretmenler"),
      ),
      body: Column(
        children: [
          PhysicalModel(
            color: Colors.white,
            elevation: 10,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 32, horizontal: 32),
                child: Text(
                    "${ogretmenlerRepository.ogretmenler.length} Öğretmen"),
              ),
            ),
          ),
          Expanded(

              child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                itemCount: ogretmenlerRepository.ogretmenler.length,
                itemBuilder: (context, index) =>
                    OgretmenSatiri(
                        ogretmenlerRepository.ogretmenler[index]),
              )),
        ],
      )
      ,
    );
  }
}

class OgretmenSatiri extends StatelessWidget {
  final Ogretmen ogretmen;

  const OgretmenSatiri(this.ogretmen, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(ogretmen.ad + ' ' + ogretmen.soyad),
      leading: ogretmen.cinsiyet == "Erkek"
          ? const Icon(Icons.man)
          : const Icon(Icons.woman),
    );
  }
}
