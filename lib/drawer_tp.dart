import 'package:flutter/material.dart';

class DrawerTp extends StatelessWidget {
  const DrawerTp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TP DRAWER'),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Text(
          'Un TP sur le DRAWER',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 30
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              child: Text(
                'Menu',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            ),
            ListTile(
              title: Text('Home'),
              leading: Icon(Icons.home),
            ),
            Divider(
              height: 3,
              color: Colors.blueAccent,
            ),
            ListTile(
              title: Text('Cours'),
              leading: Icon(Icons.book),
            ),
            Divider(
              height: 3,
              color: Colors.blueAccent,
            )
          ],
        ),
      ),
    );
  }
}
