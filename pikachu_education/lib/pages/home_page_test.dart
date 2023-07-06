import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:pikachu_education/pages/profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Image.asset('assets/image/logo.png'),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                color: Colors.black,
              ))
        ],
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.menu,
        foregroundColor: Colors.black,
        activeIcon: Icons.close,
        backgroundColor: Colors.yellow,
        children: [
          SpeedDialChild(
            backgroundColor: Colors.red,
            child: const Icon(Icons.people),
            label: 'Profile',
            labelBackgroundColor: Colors.red,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
          ),
          SpeedDialChild(
            backgroundColor: Colors.grey,
            child: const Icon(Icons.settings),
            label: 'Settings',
            labelBackgroundColor: Colors.grey,
            onTap: () {
              // Handle Phone menu action
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.camera),
            label: 'Camera',
            onTap: () {
              // Handle Camera menu action
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Home Page Content'),
      ),
    );
  }
}
