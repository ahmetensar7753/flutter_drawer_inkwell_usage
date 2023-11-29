import 'package:drawer_inkwell_kullanimi/models/veri.dart';
import 'package:flutter/material.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  late List<Veri> tumVeriler;
  @override
  void initState() {
    super.initState();
    tumVeriler = [
      Veri('Başlık1', false, 'İçerik1'),
      Veri('Başlık2', false, 'İçerik2'),
      Veri('Başlık3', false, 'İçerik3'),
      Veri('Başlık4', false, 'İçerik4'),
      Veri('Başlık5', false, 'İçerik5'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return ExpansionTile(
          key: PageStorageKey(index),
          initiallyExpanded: tumVeriler[index].expanded,
          title: Text(
            tumVeriler[index].baslik,
          ),
          children: [
            Container(
              color:
                  index % 2 == 0 ? Colors.red.shade200 : Colors.yellow.shade300,
              height: 300,
              width: double.infinity,
              child: Text(tumVeriler[index].icerik),
            ),
          ],
        );
      },
      itemCount: tumVeriler.length,
    );
  }
}
