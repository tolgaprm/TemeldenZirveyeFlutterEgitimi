import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/Ogretmen.dart';

class OgretmenlerRepository extends ChangeNotifier {
  List ogretmenler = [
    Ogretmen("Ahmet", "kokad", 15, "Erkek"),
    Ogretmen("Ayşe", "Çelik", 17, "Kadın"),
  ];

  void download() {
    const j = """{"ad": "Tolga", "soyad": "Pirim", "yas": 22, "cinsiyet": "Erkek"}""";

    final m = jsonDecode(j);

    var ogretmen = Ogretmen.fromMap(m);

    ogretmenler.add(ogretmen);
    notifyListeners();
  }
}

final ogretmenProvider = ChangeNotifierProvider((ref) {
  return OgretmenlerRepository();
});
