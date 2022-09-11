import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OgretmenlerRepository extends ChangeNotifier {
  List ogretmenler =[
    Ogretmen("Ahmet", "kokad", 15, "Erkek"),
    Ogretmen("Ayşe", "Çelik", 17, "Kadın"),
  ];
}

final ogretmenProvider = ChangeNotifierProvider((ref)  {
  return OgretmenlerRepository();
});

class Ogretmen {
  String ad;
  String soyad;
  int yas;
  String cinsiyet;

  Ogretmen(this.ad, this.soyad, this.yas, this.cinsiyet);
}
