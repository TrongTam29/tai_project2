import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GgLoginController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);
  late String _uuid;

  Future<User> loginWithGoogle() async {
    try {
      googleAccount.value = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleAccount.value!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final user = (await auth.signInWithCredential(credential)).user;

      _uuid = user!.uid;

      return user;
    } catch (e) {
      throw (e);
    }
  }

  Future<void> logoutGoogle() async {
    googleAccount.value = await googleSignIn.signOut();
    auth.signOut();
  }

  logIn() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString('uid', _uuid);
  }

  Future<String> autoLogin() async {
    var prefs = await SharedPreferences.getInstance();

    String? _uid = prefs.getString('uid');

    return _uid.toString();
  }

  logOut() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove('uid');
    await prefs.remove('userId');
  }
}
