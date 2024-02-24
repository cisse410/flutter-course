import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home.dart';

class Onglets extends StatelessWidget {
  const Onglets({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('T A B B A R',),
              centerTitle: true,
              backgroundColor: Colors.blue,
              bottom: const TabBar(tabs: [
                Tab(
                  icon: Icon(Icons.home),
                ),
                Tab(
                  icon: Icon(Icons.contact_page),
                ),
                Tab(
                  icon: Icon(Icons.info),
                ),
              ]),
            ),
            body: const TabBarView(children: [
              Home(),
              Icon(Icons.abc),
              Icon(Icons.abc),
            ])));
  }
}
