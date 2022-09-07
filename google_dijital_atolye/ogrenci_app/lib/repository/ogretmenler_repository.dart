class OgretmenlerRepository {
  List ogretmenler =[
    Ogretmen("Ahmet", "kokad", 15, "Erkek"),
    Ogretmen("Ayşe", "Çelik", 17, "Kadın"),
  ];
}

class Ogretmen {
  String ad;
  String soyad;
  int yas;
  String cinsiyet;

  Ogretmen(this.ad, this.soyad, this.yas, this.cinsiyet);
}
