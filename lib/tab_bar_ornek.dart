import 'package:flutter/material.dart';

class TabBarOrnek extends StatefulWidget {
  const TabBarOrnek({Key? key}) : super(key: key);

  @override
  State<TabBarOrnek> createState() => _TabBarOrnekState();
}

class _TabBarOrnekState extends State<TabBarOrnek>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tab Bar Kullanımı'),
        bottom: tabBarim(),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Container(
            color: Colors.red,
            child: const Center(
              child: Text(
                'TAB-1',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Container(
            color: Colors.green,
            child: const Center(
              child: Text(
                'TAB-2',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Container(
            color: Colors.orange,
            child: const Center(
              child: Text(
                'TAB-3',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TabBar tabBarim() {
    return TabBar(controller: tabController, tabs: const [
      Tab(
        icon: Icon(Icons.abc),
        //text: 'Tab 1',
        child: Text('Child-1'),
      ),
      Tab(
        icon: Icon(Icons.lock),
        //text: 'Tab 2',
        child: Text('Child-2'),
      ),
      Tab(
        icon: Icon(Icons.person),
        //text: 'Tab 3',
        child: Text('Child-3'),
      ),
    ]);
  }
}
