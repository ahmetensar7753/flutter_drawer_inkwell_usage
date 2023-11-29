import 'package:drawer_inkwell_kullanimi/ana_sayfa.dart';
import 'package:drawer_inkwell_kullanimi/arama.dart';
import 'package:drawer_inkwell_kullanimi/page_view.dart';
import 'package:drawer_inkwell_kullanimi/tab_bar_ornek.dart';

import 'package:flutter/material.dart';

class DrawerKullanimi extends StatefulWidget {
  const DrawerKullanimi({Key? key}) : super(key: key);

  @override
  State<DrawerKullanimi> createState() => _DrawerKullanimiState();
}

class _DrawerKullanimiState extends State<DrawerKullanimi> {
  int secilenMenuItem = 0;
  late List<Widget> tumSayfalar;
  late AnaSayfa sayfaAna;
  late AramaSayfasi sayfaArama;
  late PageViewOrnek pageViewOrnek;

  var keyAnaSayfa = const PageStorageKey('key_ana_sayfa');
  var keyArama = const PageStorageKey('key_arama_sayfasi');

  @override
  void initState() {
    super.initState();
    sayfaAna = AnaSayfa(key: keyAnaSayfa);
    sayfaArama = AramaSayfasi(key: keyArama);
    pageViewOrnek = const PageViewOrnek();
    tumSayfalar = [sayfaAna, sayfaArama, pageViewOrnek];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      'https://bilimvegelecek.com.tr/wp-content/uploads/2018/01/yazilim-bilisim-kodlama-1.jpg'),
                ),
              ),
              accountName: Text('Ahmet Ensar Beşir'),
              accountEmail: Text('ensarbesir7753@gmail.com'),
              /* currentAccountPicture: Image.network(
                  'https://bilimvegelecek.com.tr/wp-content/uploads/2018/01/yazilim-bilisim-kodlama-1.jpg'), //bu kısımda hesap resmi ekleniyor */
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundColor: Colors.red,
                  child: Text(
                    'AE',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Text(
                    'B',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  const ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Ana Sayfa'),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  const Divider(
                    color: Colors.black,
                    indent: 5,
                    endIndent: 5,
                    thickness: 2,
                  ),
                  const ListTile(
                    leading: Icon(Icons.call),
                    title: Text('Ara'),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  const Divider(
                    color: Colors.black,
                    indent: 5,
                    endIndent: 5,
                    thickness: 2,
                  ),
                  const ListTile(
                    leading: Icon(Icons.account_box),
                    title: Text('Profil'),
                    trailing: Icon(Icons.chevron_right),
                  ),
                  const Divider(
                    color: Colors.black,
                    indent: 5,
                    endIndent: 5,
                    thickness: 2,
                  ),
                  InkWell(
                    onTap: () {},
                    splashColor: Colors.cyan,
                    splashFactory: InkRipple.splashFactory,
                    child: const ListTile(
                      leading: Icon(Icons.account_box),
                      title: Text('deneme'),
                      trailing: Icon(Icons.chevron_right),
                    ),
                  ),
                  const AboutListTile(
                    applicationName: 'Drawer Kullanımı',
                    applicationIcon: Icon(Icons.list),
                    applicationVersion: '1.0',
                    applicationLegalese: 'BURASI',
                    icon: Icon(Icons.info),
                    aboutBoxChildren: [
                      Text('box Children-1'),
                      Text('box Children-2'),
                      Text('box Children-3'),
                    ],
                    child: Text('Child kısmı ABOUT US'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Drawer Kullanimi'),
      ),
      body: secilenMenuItem <= tumSayfalar.length - 1
          ? tumSayfalar[secilenMenuItem]
          : tumSayfalar[0],
      bottomNavigationBar: bottomNavKullanimi(),
    );
  }

  Widget bottomNavKullanimi() {
    return Theme(
      data: ThemeData(canvasColor: Colors.cyan),
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Ana Sayfa',
            backgroundColor: Colors.blueGrey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Ara',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_alarms),
            label: 'Alarmlar',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.backpack),
            label: 'Çanta',
            backgroundColor: Colors.blue,
            activeIcon: Icon(Icons.book), // actif olduğunda icon değişiyor.
          ),
        ],
        type: BottomNavigationBarType
            .shifting, // 4 tane elemandan fazla olduğunda shifting modda oluyor. backround vermek gerekiyor.
        // fixed moda alınca düzeliyor.
        currentIndex: secilenMenuItem,
        fixedColor: Colors.amber,
        onTap: (index) {
          setState(() {
            secilenMenuItem = index;
            if (index == 3) {
              Navigator.of(context)
                  .push(MaterialPageRoute(
                      builder: (context) => const TabBarOrnek()))
                  .then((bb) => secilenMenuItem = 0);
            }
          });
        },
      ),
    );
  }
}
