import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

//Google sign in

Future<UserCredential> signInWithGoogle() async {
  final GoogleSignInAccount googleUser = (await GoogleSignIn().signIn());
  if (googleUser != null) {
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    if (googleAuth.idToken != null) {
      final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } else {
      throw FirebaseAuthException(
          message: 'Missing Google ID Token',
          code: 'ERROR_MISSING_GOOGLE_ID_TOKEN');
    }
  } else {
    throw FirebaseAuthException(
        message: 'Sign In aborted by user', code: 'ERROR_ABORTED_BY_USER');
  }
}

Future<void> signOut() async {
  final googleSignIn = GoogleSignIn();
  await googleSignIn.signOut();
  await FirebaseAuth.instance.signOut();
}
