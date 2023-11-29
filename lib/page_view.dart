import 'package:flutter/material.dart';

class PageViewOrnek extends StatefulWidget {
  const PageViewOrnek({Key? key}) : super(key: key);

  @override
  State<PageViewOrnek> createState() => _PageViewOrnekState();
}

class _PageViewOrnekState extends State<PageViewOrnek> {
  bool yatayEksen = true;
  bool pageSnapping = true;
  bool reverseSira = false;
  var myController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            scrollDirection:
                yatayEksen == true ? Axis.horizontal : Axis.vertical,
            reverse: reverseSira,
            controller: myController,
            pageSnapping: pageSnapping,
            onPageChanged: (index) {
              debugPrint('page change gelen index $index');
            },
            children: [
              Container(
                width: double.infinity,
                color: Colors.indigo,
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                        'Sayfa 0',
                        style: TextStyle(fontSize: 30),
                      ),
                      ElevatedButton(
                          onPressed: () {
                            //myController.jumpToPage(2); //2. sayfaya geçiş
                            myController.jumpTo(
                                100); //yatay eksende 100 birim yana kayma.
                          },
                          child: const Text('2.Sayfaya Git'))
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.amber,
                child: const Center(
                  child: Text(
                    'Sayfa 1',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                color: Colors.green.shade600,
                child: const Center(
                  child: Text(
                    'Sayfa 2',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            height: 200,
            color: Colors.grey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text('Yatay Eksende Çalış'),
                      Checkbox(
                          value: yatayEksen,
                          onChanged: (b) {
                            setState(() {
                              yatayEksen = b!;
                            });
                          })
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text('Page Snapping'),
                      Checkbox(
                          value: pageSnapping,
                          onChanged: (b) {
                            setState(() {
                              pageSnapping = b!;
                            });
                          })
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Text('Reverse'),
                      Checkbox(
                          value: reverseSira,
                          onChanged: (b) {
                            setState(() {
                              reverseSira = b!;
                            });
                          })
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
