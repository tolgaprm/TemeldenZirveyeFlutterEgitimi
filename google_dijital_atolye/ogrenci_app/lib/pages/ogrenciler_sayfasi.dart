import 'package:flutter/material.dart';
import 'package:ogrenci_app/repository/ogrenciler_repository.dart';

class OgrencilerSayfasi extends StatefulWidget {
  final OgrencilerRepository ogrencilerRepository;

  const OgrencilerSayfasi(this.ogrencilerRepository, {Key? key})
      : super(key: key);

  @override
  State<OgrencilerSayfasi> createState() => _OgrencilerSayfasiState();
}

class _OgrencilerSayfasiState extends State<OgrencilerSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Öğrenciler"),
      ),
      body: Column(
        children: [
          PhysicalModel(
            color: Colors.white,
            elevation: 10,
            child: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
                child: Text(
                    "${widget.ogrencilerRepository.ogrenciler.length} Öğrenci"),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => OgrenciSatir(
                    widget.ogrencilerRepository.ogrenciler[index],
                    widget.ogrencilerRepository),
                separatorBuilder: (context, index) => Divider(),
                itemCount: widget.ogrencilerRepository.ogrenciler.length),
          ),
        ],
      ),
    );
  }
}

class OgrenciSatir extends StatefulWidget {
  final Ogrenci ogrenci;
  final OgrencilerRepository ogrencilerRepository;

  const OgrenciSatir(
    this.ogrenci,
    this.ogrencilerRepository, {
    Key? key,
  }) : super(key: key);

  @override
  State<OgrenciSatir> createState() => _OgrenciSatirState();
}

class _OgrenciSatirState extends State<OgrenciSatir> {
  @override
  Widget build(BuildContext context) {
    bool seviyormu = widget.ogrencilerRepository.seviyormu(widget.ogrenci);
    return ListTile(
      title: Text(widget.ogrenci.ad + ' ' + widget.ogrenci.soyad),
      trailing: IconButton(
        onPressed: () {
          setState(() {
            widget.ogrencilerRepository.sev(widget.ogrenci, seviyormu);
          });
        },
        icon: seviyormu
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border_outlined),
      ),
      leading: widget.ogrenci.cinsiyet == "Erkek"
          ? const Icon(Icons.man)
          : const Icon(Icons.woman),
    );
  }
}
