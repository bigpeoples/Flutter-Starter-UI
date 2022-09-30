import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppConstants.dart';
import 'package:nb_utils/nb_utils.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future signInWithGoogle() async {
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

  if (googleSignInAccount == null) throw '';

  final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final UserCredential authResult = await _auth.signInWithCredential(credential);
  final User? user = authResult.user;

  if (user != null) {
    await setValue(IsLoggedInSocialLogin, true);
    await setValue(UserName, user.displayName);
    await setValue(UserEmail, user.email);
    await setValue(UserPhoto, user.photoURL);

    appStore.setLoggedIn(true);

    await googleSignIn.signOut();
  }
}

Future logout() async {
  setValue(IsLoggedInSocialLogin, false);
  await removeKey(UserName);
  await removeKey(UserEmail);
  await removeKey(UserPhoto);

  appStore.setLoggedIn(false);
}
