import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:social_media_integration/services/facebook_sign_in.dart';
import 'package:social_media_integration/services/google_sign_in.dart';
import 'package:social_media_integration/widgets/SignInButton.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[600],
      appBar: AppBar(
        title: Text('Social Media Integration'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                    colors: [Colors.blue[200], Colors.blue]),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: Column(
                    children: [
                      Container(
                        width: 110.0,
                        height: 110.0,
                        child: Image.asset(
                          'images/logo.png',
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'The Sparks Foundation',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 250.0),
              child: Container(
                alignment: Alignment.bottomCenter,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(50),
                    topRight: const Radius.circular(50),
                  ),
                  color: Colors.white,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Column(
                          children: [
                            SignInButton(
                              height: 50.0,
                              width: 240.0,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'images/google-logo.png',
                                    scale: 1.0,
                                  ),
                                  Text(
                                    'Sign In With Google',
                                    style: TextStyle(color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  Opacity(
                                    opacity: 0.0,
                                    child: Image.asset(
                                      'images/google-logo.png',
                                      scale: 1.0,
                                    ),
                                  ),
                                ],
                              ),
                              style: ButtonStyle(
                                elevation:
                                    MaterialStateProperty.all<double>(10.0),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                              ),
                              onPressed: () {
                                signInWithGoogle().then((value) =>
                                    Navigator.of(context)
                                        .pushReplacementNamed('/homepage'));
                              },
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            SignInButton(
                              height: 50.0,
                              width: 240.0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(
                                    'images/facebook-logo.png',
                                    scale: 1.0,
                                  ),
                                  Text(
                                    'Sign In With facebook',
                                    style: TextStyle(color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                  Opacity(
                                    opacity: 0.0,
                                    child: Image.asset(
                                      'images/facebook-logo.png',
                                      scale: 1.5,
                                    ),
                                  ),
                                ],
                              ),
                              style: ButtonStyle(
                                elevation:
                                    MaterialStateProperty.all<double>(10.0),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue),
                              ),
                              onPressed: () {
                                signInWithFacebook().then((value) =>
                                    Navigator.of(context)
                                        .pushReplacementNamed('/homepage'));
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
