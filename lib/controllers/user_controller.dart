import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserController {
  static User? user=FirebaseAuth.instance.currentUser;
   Future<User?> loginWithGoogle() async {
    // print('call google signin');
    // const List<String> scopes = <String>[
    //   'email',
    //   'https://www.googleapis.com/auth/contacts.readonly',
    // ];

    GoogleSignIn _googleSignIn = GoogleSignIn(
      // Optional clientId
      // clientId: 'your-client_id.apps.googleusercontent.com',
      // scopes: scopes,
    );
    final googleAccount = await _googleSignIn.signIn();
    final googleAuth = await googleAccount?.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    final userCredential = await FirebaseAuth.instance.signInWithCredential(
      credential,
    );
    return userCredential.user;
  }
}