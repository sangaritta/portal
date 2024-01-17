import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
            onPressed: (){},
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

        }, 
        child: Image.asset("assets/images/ico.png")
        
        ,),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(onPressed: (){}, child: const Text("My Music")),
            TextButton(onPressed: (){}, child: const Text("Analytics")),
            TextButton(onPressed: (){}, child: const Text("Bank"))
          ],
        ),
      ),

    );
  }
}