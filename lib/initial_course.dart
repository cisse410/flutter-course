import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentTab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("Cours flutter"),
        ),  
        body: const Center(
          child: Text(
            'Mes cours flutter',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
          ],
          onTap: (i) {
            currentTab = i;
            print(currentTab);
          },
        ),
        drawer: Drawer(
          child: ListView(
            children: const [
              DrawerHeader(
                  decoration: BoxDecoration(color: Colors.deepOrange),
                  child: Text('Informations')),
              ListTile(
                title: Text('Home'),
                leading: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
                trailing: Icon(
                  Icons.arrow_right,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: 5,
                width: 21,
              ),
              ListTile(
                title: Text('Profile'),
                leading: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
                trailing: Icon(
                  Icons.arrow_right,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      );
  }
}