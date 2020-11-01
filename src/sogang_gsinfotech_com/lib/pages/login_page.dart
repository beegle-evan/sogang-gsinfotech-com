import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'tab_page.dart';
import '../constant/constant.dart';

class LoginPage extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              APP_LOGO_FULL_PATH,
              width: 300,
              fit: BoxFit.cover,
            ),
            Text(APP_TITLE_WITHOUT_LOGO,
              style: GoogleFonts.pacifico(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.all(50.0),
            ),
            SignInButton(
              Buttons.Google,
              onPressed: () {
                _handleSignIn().then((user){
                  print(user);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> TabPage(user)));
                  //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>TabPage(user)));
                });
              },
            )
          ],
        ),
      )
    );
  }

  Future<FirebaseUser> _handleSignIn() async {
    GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    FirebaseUser user = (await _auth.signInWithCredential(GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken))).user;
    print("signed in " + user.displayName);
    return user;
  }
}
