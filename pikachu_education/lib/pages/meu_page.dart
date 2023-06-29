import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pikachu_education/pages/login_page.dart';
import 'package:pikachu_education/pages/signup_page/profile_page.dart';

class MenuApp extends StatefulWidget {
  const MenuApp({super.key});

  @override
  State<MenuApp> createState() => _MenuAppState();
}

class _MenuAppState extends State<MenuApp> {
  void _showScreen(BuildContext context, Widget screen) {
    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      PageTransition(
        child: screen,
        type: PageTransitionType.rightToLeftWithFade,
        duration: const Duration(milliseconds: 500),
      ),
    );
  }

  // final User user = FirebaseAuth.instance.currentUser!;

  // void signUserOut() {
  //   FirebaseAuth.instance.signOut();
  // }

  @override
  Widget build(BuildContext context) {
    // final themeProvider = Provider.of<ThemeProvider>(context);
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.lightBlue),
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    child: Icon(
                      Icons.account_circle,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'name',
                    textScaleFactor: 1.5,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Colors.orange,
            ),
            title: const Text('Overview'),
            onTap: () {
              _showScreen(context, const ProfileApp());
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Color.fromARGB(255, 143, 122, 122),
            ),
            title: const Text('Settings'),
            onTap: () {
              _showScreen(context, const LoginPage());
            },
          ),
        ],
      ),
    );
  }
}
