import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_media_integration/services/google_sign_in.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final User currentUser = FirebaseAuth.instance.currentUser;

    return new Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue[100], Colors.blue]),
          ),
          child: Center(
            child: new Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 120.0, horizontal: 40.0),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      color: Colors.white,
                    ),
                    child: new Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        new CircleAvatar(
                          maxRadius: 45,
                          backgroundImage: NetworkImage(currentUser.photoURL),
                        ),
                        SizedBox(
                          height: 25.0,
                        ),
                        new Text('Hello, ' + currentUser.displayName),
                        SizedBox(
                          height: 20.0,
                        ),
                        new Text(
                          'E-mail : ' + currentUser.email,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        FractionallySizedBox(
                          widthFactor: 0.3,
                          child: new ElevatedButton(
                            onPressed: () {
                              signOut()
                                  .then(
                                (value) => Navigator.pushReplacementNamed(
                                    context, '/loginpage'),
                              )
                                  .catchError((e) {
                                print(e);
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                            ),
                            child: Text('Sign Out', textScaleFactor: 1.1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
