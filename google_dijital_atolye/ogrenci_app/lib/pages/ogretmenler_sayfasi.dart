import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/repository/ogretmenler_repository.dart';

import '../models/Ogretmen.dart';

class OgretmenlerSayfasi extends ConsumerWidget {
  const OgretmenlerSayfasi({Key? key}) : super(key: key);

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
            child: Stack(
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 32, horizontal: 32),
                    child: Text(
                        "${ogretmenlerRepository.ogretmenler.length} Öğretmen"),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: OgretmenIndirmeButonu(),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: ogretmenlerRepository.ogretmenler.length,
            itemBuilder: (context, index) =>
                OgretmenSatiri(ogretmenlerRepository.ogretmenler[index]),
          )),
        ],
      ),
    );
  }
}

class OgretmenIndirmeButonu extends StatefulWidget {
  const OgretmenIndirmeButonu({
    Key? key,
  }) : super(key: key);

  @override
  State<OgretmenIndirmeButonu> createState() => _OgretmenIndirmeButonuState();
}

class _OgretmenIndirmeButonuState extends State<OgretmenIndirmeButonu> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return isLoading
            ? const CircularProgressIndicator()
            : IconButton(
                onPressed: () async {
                  try {
                    setState(() {
                      isLoading = true;
                    });
                    await ref.read(ogretmenProvider).indir();
                  } catch (e) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Hata")));
                  } finally {
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                icon: const Icon(Icons.download));
      },
    );
  }
}

class OgretmenSatiri extends StatelessWidget {
  final Ogretmen ogretmen;

  const OgretmenSatiri(
    this.ogretmen, {
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
