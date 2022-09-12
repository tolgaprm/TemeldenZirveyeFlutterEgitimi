import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/Ogrenci.dart';

class OgrencilerRepository extends ChangeNotifier {
  final ogrenciler = [
    Ogrenci("Ahmet", "kokad", 15, "Erkek"),
    Ogrenci("Ayşe", "Çelik", 17, "Kadın"),
  ];

  final Set<Ogrenci> sevdiklerim = {};

  void sev(Ogrenci ogrenci, bool seviyormu) {
    if (seviyormu) {
      sevdiklerim.remove(ogrenci);
    } else {
      sevdiklerim.add(ogrenci);
    }
    notifyListeners();
  }

  bool seviyormu(Ogrenci ogrenci) {
    return sevdiklerim.contains(ogrenci);
  }
}

final ogrencilerProvider = ChangeNotifierProvider((ref) {
  return OgrencilerRepository();
} );


