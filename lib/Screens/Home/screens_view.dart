import 'package:flutter/material.dart';
import 'package:portal/Screens/Home/Pages/artists_page.dart';
import 'package:portal/Screens/Home/Pages/dashboard_page.dart';
import 'package:portal/Screens/Login/login_screen.dart';
import 'package:portal/Services/auth_service.dart';

class ScreensView extends StatelessWidget {
  final String menu;
  const ScreensView({Key? key, required this.menu}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (menu) {
      case 'Dashboard':
        page = const DashboardPage();
        break;
      case 'My Artists':
        page = const ArtistsPage();
        break;

      default:
        page = const ArtistsPage();
    }
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 1, 0, 10),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 1, 0, 10),
        actions: [
          IconButton(
          onPressed: (){},
          icon: const Icon(Icons.account_circle_rounded,
          color: Colors.white,
          )),
          IconButton(
          onPressed: () async {
            await auth.signOut();
            // ignore: use_build_context_synchronously
            Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (c) {
                return const LoginScreen();
              }));
          },
          icon: const Icon(Icons.logout_rounded,
          color: Colors.red,
          )),


        ],
      ),
      body: page,
    );
  }
}