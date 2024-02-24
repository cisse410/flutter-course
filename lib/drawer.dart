import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter course'),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: UserAccountsDrawerHeader(
                accountName: Text('CISSE410'),
                accountEmail: Text('quoifaireavec@gmail.com'),
                currentAccountPictureSize: Size(25, 25),
                otherAccountsPictures: [
                  CircleAvatar(
                    child: Icon(Icons.person),
                  )
                ],
                // currentAccountPictureSize: Size.square(25),
              ),
            ),
            ListTile(
              title: const Text('Profile'),
              leading: const Icon(Icons.person),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            const Divider(height: 5, color: Colors.deepPurple),
            const ListTile(
              title: Text('Mes cours'),
              leading: Icon(Icons.book),
            ),
            const Divider(height: 5, color: Colors.deepPurple,),
            const ListTile(
              title: Text('Deconnecter'),
              leading: Icon(Icons.logout),
            ),
            const Divider(
              height: 5,
              color: Colors.deepPurple,
            )
          ],
        ),
      ),
    );
  }
}
