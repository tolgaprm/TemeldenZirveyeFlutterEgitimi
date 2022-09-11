import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/pages/mesajlar_sayfasi.dart';
import 'package:ogrenci_app/pages/ogrenciler_sayfasi.dart';
import 'package:ogrenci_app/pages/ogretmenler_sayfasi.dart';
import 'package:ogrenci_app/repository/mesajlar_repository.dart';
import 'package:ogrenci_app/repository/ogrenciler_repository.dart';
import 'package:ogrenci_app/repository/ogretmenler_repository.dart';

void main() {
  runApp(const ProviderScope(child: OgrenciApp()));
}

class OgrenciApp extends StatelessWidget {
  const OgrenciApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Öğrenci Uygulaması',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Öğrenci Ana Sayfa'),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  void ogrencilerSayfasinaGit(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return const OgrencilerSayfasi();
      },
    ));
  }

  void ogretmenlerSayfasinaGit(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return const OgretmenlerSayfasi();
      },
    ));
  }

  Future<void> mesajlarrSayfasinaGit(BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return const MesajlarSayfasi();
      },
    ));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ogrencilerRepository = ref.watch(ogrencilerProvider);
    final ogretmenlerRepository = ref.watch(ogretmenProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: Drawer(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo),
            child: Text("Öğrenci Adı"),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: GestureDetector(
              child: const Text(
                "Mesajlar",
              ),
              onTap: () {
                mesajlarrSayfasinaGit(context);
              },
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Öğrenciler ",
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Öğretmenler ",
            ),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Mesajlar ",
            ),
          ),
        ],
      )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextButton(
                onPressed: () {
                  mesajlarrSayfasinaGit(context);
                },
                child: Text(
                  "${ref.watch(yeniMesajSayisiProvider)} yeni Mesaj",
                  style: const TextStyle(color: Colors.blue),
                )),
            TextButton(
              onPressed: () {
                ogrencilerSayfasinaGit(context);
              },
              child: Text(
                "${ogrencilerRepository.ogrenciler.length} Öğrenci",
                style: const TextStyle(color: Colors.blue),
              ),
            ),
            TextButton(
              onPressed: () {
                ogretmenlerSayfasinaGit(context);
              },
              child: Text(
                  "${ogretmenlerRepository.ogretmenler.length} Öğretmen",
                  style: const TextStyle(color: Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }
}
