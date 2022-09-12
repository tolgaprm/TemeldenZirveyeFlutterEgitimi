import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ogrenci_app/models/Ogretmen.dart';

class DataService{
  Ogretmen ogretmenIndir() {
    const j =
    """{"ad": "Tolga", "soyad": "Pirim", "yas": 22, "cinsiyet": "Erkek"}""";

    final m = jsonDecode(j);

    var ogretmen = Ogretmen.fromMap(m);

    return ogretmen;
  }

}

final dataServiceProvider = Provider((ref) {
  return DataService();
});
