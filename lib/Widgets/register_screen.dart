import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal/Screens/Home/welcome_screen.dart';
import 'package:portal/Screens/Register/welcome_page.dart';

class RegisterScaffold extends StatefulWidget {
  const RegisterScaffold({super.key});

  @override
  State<RegisterScaffold> createState() => _RegisterScaffoldState();
}

class _RegisterScaffoldState extends State<RegisterScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageSelector(),

    );
  }
}
int page = 0;
Widget pageSelector(){
  switch (page) {
    case 0:
      return WelcomePage();
    default:
    return WelcomePage();
  }
}

