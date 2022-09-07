class OgrencilerRepository {
  final ogrenciler = [
    Ogrenci("Ahmet", "kokad", 15, "Erkek"),
    Ogrenci("Ayşe", "Çelik", 17, "Kadın"),
  ];

  final Set<Ogrenci> sevdiklerim = {};

  void sev(Ogrenci ogrenci,bool seviyormu) {
    if(seviyormu){
      sevdiklerim.remove(ogrenci);
    }else{
      sevdiklerim.add(ogrenci);

    }

  }

  bool seviyormu(Ogrenci ogrenci) {
    return sevdiklerim.contains(ogrenci);
  }
}

class Ogrenci {
  String ad;
  String soyad;
  int yas;
  String cinsiyet;

  Ogrenci(this.ad, this.soyad, this.yas, this.cinsiyet);
}
