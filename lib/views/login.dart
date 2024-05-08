import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nepraproj/auth/auth_service.dart';
import 'package:nepraproj/views/hydro.dart';
import 'package:nepraproj/views/register.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../widgets/text_fields.dart';

class Login extends StatelessWidget {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _pwcontroller = TextEditingController();

  final RoundedLoadingButtonController LoginbtnController =
      RoundedLoadingButtonController();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.electric_meter,
                size: 60,
                color: Colors.orange,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome!",
                style: GoogleFonts.poppins(fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
              MyTextField(
                controller: _emailcontroller,
                label: Text(
                  "Email",
                  style: GoogleFonts.poppins(),
                ),
                icn: Icon(Icons.email_outlined),
                obscuretext: false,
              ),
              SizedBox(
                height: 10,
              ),
              MyTextField(
                  controller: _pwcontroller,
                  label: Text(
                    "Password",
                    style: GoogleFonts.poppins(),
                  ),
                  icn: Icon(Icons.password_outlined),
                  obscuretext: true),
              SizedBox(
                height: 10,
              ),
              RoundedLoadingButton(
                width: 2000,
                borderRadius: 10,
                controller: LoginbtnController,
                color: (Colors.grey.shade600),
                onPressed: () async {
                  final authService = AuthService();

                  try {
                    await authService.SignInWithEmailPassword(
                        _emailcontroller.text, _pwcontroller.text);

                    Timer(Duration(seconds: 3), () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade, child: Hydro()));
                    });
                  } catch (e) {
                    showDialog(
                      context: context,
                      builder: (context) =>
                          AlertDialog(title: Text(e.toString())),
                    );
                    LoginbtnController.reset();
                  }

                  // Timer(Duration(seconds: 3), () {
                  //   LoginbtnController.success();
                  //   Navigator.pushReplacement(
                  //       context,
                  //       PageTransition(
                  //           type: PageTransitionType.fade, child: Login()));
                  // });
                },
                child: Text(
                  "Login",
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member? ",
                    style: GoogleFonts.poppins(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              type: PageTransitionType.fade,
                              child: Register()));
                    },
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
