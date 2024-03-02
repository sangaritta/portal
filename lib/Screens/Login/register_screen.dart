import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portal/Constants/fonts.dart';
import 'package:portal/Screens/Login/forgotpass_screen.dart';
import 'package:portal/Widgets/signup_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool _isLoading = false;
    var emailCtrl;
    var passCtrl;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            "assets/images/backdrop.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            isAntiAlias: true,
            filterQuality: FilterQuality.high,
          ),
          Center(
            child: ListView(
              children: <Widget>[
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    height: 140,
                    width: 180,
                    child: Image.asset("assets/images/ico.png", isAntiAlias: true, filterQuality: FilterQuality.high,),
                  ),
                ),
                const Center(
                  child: SizedBox(
                    height: 40,
                    child: Text(
                      "BlackMatter Portal",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontFamily: fontNameBold,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
                const Center(
                  child: SizedBox(
                    height: 40,
                    child: Text(
                      "Welcome! Register first",
                      style: TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.none,
                        fontFamily: fontNameSemiBold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: RegisterScreen(),

                ),
                
              
              ],
            ),
          ),
        ],
      ),
    );
  }
}