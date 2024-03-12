import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:portal/Screens/Home/home_screen.dart';
import 'package:portal/Screens/Home/sidebar_menu.dart';
import 'package:portal/Screens/Login/forgotpass_screen.dart';
import 'package:portal/Services/auth_service.dart';
import 'package:portal/Services/permissions_service.dart';
import 'package:portal/Constants/colors.dart';
import 'package:portal/Constants/fonts.dart';
import 'package:portal/Widgets/signup_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  bool _isLoading = false;

  Future<void> login() async {
    setState(() {
      _isLoading = true;
    });

    if (emailCtrl.text.isNotEmpty &&
        isEmail(emailCtrl.text.trim()) &&
        passCtrl.text.isNotEmpty) {
      try {
        await auth.signIn(emailCtrl.text.trim(), passCtrl.text);
        // Éxito en la autenticación
        User? user = FirebaseAuth.instance.currentUser;
        if (user != null) {
          permissionsService.requestNotifications();
          setState(() {
            Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
          });
        }
      } on FirebaseAuthException catch (e) {
        setState(() {
          _isLoading = false;
        });

        if (e.code == 'user-not-found' || e.code == 'wrong-password' || e.code == 'invalid-credential') {
          setState(() {
             ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Wrong Credentials',
                style: TextStyle(fontFamily: fontNameSemiBold),
              ),
            ),
          );
          });
         
        } else {
          setState(() {
             ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
              content: Row(
                children: [
                  const Icon(
                    Icons.error_rounded,
                    color: Colors.white,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                    child: Text(
                      //e.toString(),//aquí sale el error
                      'An Error Ocurred: ${e.code}',
                      style: const TextStyle(fontFamily: fontNameSemiBold),
                    ),
                  ),
                ],
              ),
            ),
          );
          });
        }
      }
    } else {
      setState(() {
        _isLoading = false;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Please fill out all fields',
              style: TextStyle(fontFamily: fontNameSemiBold),
            ),
          ),
        );
      });
    }
  }

  bool isEmail(String email) {
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(pattern);

    return regExp.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
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
                      "Welcome Back",
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
                  child: const SizedBox(
                    child: RainbowButton(),
                  ),
                ),
                UnconstrainedBox(
                  child: Container(
                    height: 275,
                    width: 450,
                    margin: const EdgeInsets.fromLTRB(25, 35, 25, 35),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          spreadRadius: 3,
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Card(
                      clipBehavior: Clip.hardEdge,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 100,
                      color: Colors.black,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  spreadRadius: 3,
                                  blurRadius: 15,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              autofillHints: const [AutofillHints.username],
                              controller: emailCtrl,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontFamily: fontNameSemiBold,
                                fontSize: 15,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              autocorrect: false,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Theme.of(context).highlightColor,
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(30),
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                                labelText: ' Email',
                                labelStyle: TextStyle(
                                  fontFamily: fontNameSemiBold,
                                  fontSize: 15,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: Colors.transparent,
                                style: BorderStyle.solid,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  spreadRadius: 3,
                                  blurRadius: 15,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            margin: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                            child: TextFormField(
                              autofillHints: const [AutofillHints.password],
                              controller: passCtrl,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontFamily: fontNameSemiBold,
                                fontSize: 15,
                              ),
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (term) {
                                login();
                              },
                              obscureText: true,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Theme.of(context).highlightColor,
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(90.0),
                                  ),
                                  borderSide: BorderSide.none,
                                ),
                                labelText: ' Password',
                                labelStyle: TextStyle(
                                  fontFamily: fontNameSemiBold,
                                  fontSize: 15,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Theme.of(context).primaryColor,
                                textStyle: const TextStyle(
                                  fontFamily: fontNameSemiBold,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotpassScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                'I Forgot My Password',
                              ),
                            ),
                          ),
                          _isLoading
                              ? Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 15, 0, 28),
                                  child: const CupertinoActivityIndicator(),
                                )
                              : ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.black, minimumSize: Size(200, 50)),
                                onPressed: (){
                                  login();
                                }, child:
                              Text("Sign In", style: TextStyle(color: Colors.pinkAccent[50]),),
                              ),                
                                
                        ],
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
