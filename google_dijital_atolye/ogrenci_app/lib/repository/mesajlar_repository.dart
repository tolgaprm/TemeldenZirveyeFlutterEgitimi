class MesajlarRepository {
  final List<Mesaj> mesajlar = [
    Mesaj(
        "Merhaba", "Ali", DateTime.now().subtract(const Duration(minutes: 3))),
    Mesaj("Orada mısın?", "Ayşe",
        DateTime.now().subtract(const Duration(minutes: 2))),
    Mesaj("Evet", "Ali", DateTime.now().subtract(const Duration(minutes: 1))),
    Mesaj("Nasılsın", "Ayşe", DateTime.now()),
  ];

  int mesajSayisi = 4;
}

class Mesaj {
  String yazi;
  String gonderen;
  DateTime zaman;

  Mesaj(this.yazi, this.gonderen, this.zaman);
}
