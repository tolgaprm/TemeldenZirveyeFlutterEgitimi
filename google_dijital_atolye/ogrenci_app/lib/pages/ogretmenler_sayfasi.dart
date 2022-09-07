import 'package:flutter/material.dart';
import 'package:ogrenci_app/repository/ogretmenler_repository.dart';

class OgretmenlerSayfasi extends StatefulWidget {
  final OgretmenlerRepository ogretmenlerRepository;

  const OgretmenlerSayfasi(this.ogretmenlerRepository, {Key? key})
      : super(key: key);

  @override
  State<OgretmenlerSayfasi> createState() => _OgretmenlerSayfasiState();
}

class _OgretmenlerSayfasiState extends State<OgretmenlerSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Öğretmenler"),
      ),
      body: Column(
        children: [
        PhysicalModel(
        color: Colors.white,
        elevation: 10,
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 32),
            child: Text(
                "${widget.ogretmenlerRepository.ogretmenler.length} Öğretmen"),
          ),
        ),
      ),
      Expanded(

          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(),
            itemCount: widget.ogretmenlerRepository.ogretmenler.length,
            itemBuilder: (context, index) =>
                OgretmenSatiri(
                    widget.ogretmenlerRepository.ogretmenler[index],
                    widget.ogretmenlerRepository),
          )),
    ],
    )
    ,
    );
  }
}

class OgretmenSatiri extends StatefulWidget {
  final Ogretmen ogretmen;
  final OgretmenlerRepository ogretmenlerRepository;

  const OgretmenSatiri(this.ogretmen,
      this.ogretmenlerRepository, {
        Key? key,
      }) : super(key: key);

  @override
  State<OgretmenSatiri> createState() => _OgretmenSatiriState();
}

class _OgretmenSatiriState extends State<OgretmenSatiri> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.ogretmen.ad + ' ' + widget.ogretmen.soyad),
      leading: widget.ogretmen.cinsiyet == "Erkek"
          ? const Icon(Icons.man)
          : const Icon(Icons.woman),
    );
  }
}
