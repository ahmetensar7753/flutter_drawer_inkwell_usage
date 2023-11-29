import 'package:flutter/material.dart';

class AramaSayfasi extends StatelessWidget {
  const AramaSayfasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemExtent: 100,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(10),
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(10),
              color:
                  index % 2 == 0 ? Colors.red.shade300 : Colors.purple.shade300,
              child: Center(
                child: Text(
                  index.toString(),
                ),
              ),
            ),
          );
        });
  }
}
