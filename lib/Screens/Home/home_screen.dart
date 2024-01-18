import 'package:flutter/material.dart';
import 'package:portal/Screens/Home/account_screen.dart';
import 'package:portal/Screens/Home/analytics_screen.dart';
import 'package:portal/Screens/Home/bank_screen.dart';
import 'package:portal/Screens/Home/catalog_screen.dart';
import 'package:portal/Screens/Home/welcome_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions:  [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.account_circle_rounded,
            size: 25,
            color: Colors.white,),
            onPressed: (){
              setState(() {
                selected = 4;
              });
            },
              ),
              
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: const Icon(Icons.menu,
            size: 25,
            color: Colors.white,),
            onPressed: (){},
              ),
              
          )
        ],
        leading: MaterialButton(onPressed: (){
          setState(() {
                selected = 0;
              });
        }, 
        child: Image.asset("assets/images/ico.png")
        
        ,),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){
              setState(() {
                selected = 1;
              });
            }, child: const Text("My Music")),
            TextButton(onPressed: (){
              setState(() {
                selected = 2;
              });
            }, child: const Text("Analytics")),
            TextButton(onPressed: (){
              setState(() {
                selected = 3;
              });
            }, child: const Text("Bank"))
          ],
        ),
      ),
      body: switch (selected) {
        0 => const WelcomeScreen(),
        1 => const CatalogScreen(),
        2 => const AnalyticsScreen(),
        3 => const BankScreen(),
        4 => const AccountScreen(),
        int() => null,
      },

    );
  }
}