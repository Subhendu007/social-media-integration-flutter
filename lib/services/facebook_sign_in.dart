import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';

//Facebook sign in

Future<User> signInWithFacebook() async {
  final fb = FacebookLogin();
  final response = await fb.logIn(permissions: [
    FacebookPermission.email,
    FacebookPermission.publicProfile,
  ]);
  switch (response.status) {
    case FacebookLoginStatus.success:
      final accessToken = response.accessToken;
      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        FacebookAuthProvider.credential(accessToken.token),
      );
      return userCredential.user;
    case FacebookLoginStatus.cancel:
      throw FirebaseException(
          plugin: 'ERROR_ABORTED_BY_USER', message: 'SignIn aborted by user');
    case FacebookLoginStatus.error:
      throw FirebaseException(
          plugin: 'ERROR_FACEBOOK_LOGIN_FAILED',
          message: response.error.developerMessage);
    default:
      throw UnimplementedError();
  }
}

Future<void> signOut() async {
  final facebookLogin = FacebookLogin();
  await facebookLogin.logOut();
  await FirebaseAuth.instance.signOut();
}
