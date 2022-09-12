import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/repository/ogrenciler_repository.dart';

import '../models/Ogrenci.dart';

class OgrencilerSayfasi extends ConsumerWidget {
  const OgrencilerSayfasi( {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final ogrencilerRepository = ref.watch(ogrencilerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Öğrenciler"),
      ),
      body: Column(
        children: [
          PhysicalModel(
            color: Colors.white,
            elevation: 10,
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
                child: Text(
                    "${ogrencilerRepository.ogrenciler.length} Öğrenci"),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => OgrenciSatir(
                    ogrencilerRepository.ogrenciler[index]),
                separatorBuilder: (context, index) => Divider(),
                itemCount: ogrencilerRepository.ogrenciler.length),
          ),
        ],
      ),
    );
  }
}

class OgrenciSatir extends ConsumerWidget {
  final Ogrenci ogrenci;


  const OgrenciSatir(
    this.ogrenci, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    bool seviyormu = ref.watch(ogrencilerProvider).seviyormu(ogrenci);
    return ListTile(
      title: Text(ogrenci.ad + ' ' + ogrenci.soyad),
      trailing: IconButton(
        onPressed: () {
          ref.read(ogrencilerProvider).sev(ogrenci, seviyormu);
        },
        icon: seviyormu
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border_outlined),
      ),
      leading: ogrenci.cinsiyet == "Erkek"
          ? const Icon(Icons.man)
          : const Icon(Icons.woman),
    );
  }
}
