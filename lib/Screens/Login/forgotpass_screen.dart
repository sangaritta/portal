import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:portal/Constants/fonts.dart';
import 'package:getwidget/getwidget.dart';
import 'package:portal/Constants/colors.dart';
import 'package:portal/Services/auth_service.dart';

class ForgotpassScreen extends StatefulWidget {
  const ForgotpassScreen({Key? key}) : super(key: key);

  @override
  State<ForgotpassScreen> createState() => _ForgotpassScreenState();
}

class _ForgotpassScreenState extends State<ForgotpassScreen> {
  final TextEditingController emailCtrl = TextEditingController();
 
  bool isEmail(String email) {
    const pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(pattern);

    return regExp.hasMatch(email);
  }

  void resetPassword() {
    if (isEmail(emailCtrl.text)) {
                                  auth.resetPassword(emailCtrl.text);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Row(
                                    children: [
                                      const Padding(padding: EdgeInsets.fromLTRB(0, 0, 15, 0,), 
                                      child: Icon(Icons.check_circle_rounded)
                                      ,),
                                      Text("If the account ${emailCtrl.text} exists, a mail would be send to reset the password"),
                                    ],
                                  ))
                                );
                                Navigator.of(context).pop();
                                }
                                else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Row(
                                    children: [
                                      Padding(padding: EdgeInsets.fromLTRB(0, 0, 15, 0,), 
                                      child: Icon(Icons.error_rounded,
                                      color: Colors.white,
                                      )
                                      ,),
                                      Text("Email is invalid"),
                                    ],
                                  ))
                                );
                                }
                                
  }

  bool _isLoading = false;
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
                      "Forgot Your Password?",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontFamily: fontNameBold,
                        fontSize: 32,
                      ),
                    ),
                  ),
                ),
                
                UnconstrainedBox(
                  child: Container(
                    height: 220,
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
                            margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  foregroundColor: Theme.of(context).primaryColor,
                                  textStyle: const TextStyle(
                                    fontFamily: fontNameSemiBold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const SizedBox(
                                  width: 80,
                                  child: Row(
                                    children: [
                                      Icon (Icons.arrow_back),
                                       Text(
                                        'Go Back',
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),                
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                                  color: Colors.black.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 15,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: TextFormField(
                              controller: emailCtrl,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontFamily: fontNameSemiBold,
                                fontSize: 15,
                              ),
                              textInputAction: TextInputAction.done,
                              onFieldSubmitted: (term) {
                               resetPassword();
                              },
                              keyboardType: TextInputType.emailAddress,
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
                         _isLoading
                              ? Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 15, 0, 28),
                                  child: const CupertinoActivityIndicator(),
                                )
                              : ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.black, minimumSize: Size(200, 50)),
                                onPressed: (){
                                  resetPassword();
                                }, child:
                              Text("Reset Password", style: TextStyle(color: Colors.pinkAccent[50]),),
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
