import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/services/DataService.dart';

import '../models/Ogretmen.dart';

class OgretmenlerRepository extends ChangeNotifier {
  List ogretmenler = [
    Ogretmen("Ahmet", "kokad", 15, "Erkek"),
    Ogretmen("Ayşe", "Çelik", 17, "Kadın")
  ];

  final DataService dataService;

  OgretmenlerRepository(this.dataService);

  Future<void> indir() async {
    Ogretmen ogretmen = await dataService.ogretmenIndir();

    ogretmenler.add(ogretmen);
    notifyListeners();
  }
}

final ogretmenProvider = ChangeNotifierProvider((ref) {
  return OgretmenlerRepository(ref.watch(dataServiceProvider));
});
