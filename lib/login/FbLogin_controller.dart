import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FbLoginController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  late String _uuid;

  Future<UserCredential?> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      final user = await auth.signInWithCredential(facebookAuthCredential);
      _uuid = user.user!.uid;

      return user;
    } catch (e) {
      throw (e);
    }
  }

  Future logoutFacebook() async {
    await FacebookAuth.instance.logOut();
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
    print('Removed ');
    await prefs.remove('uid');
  }
}
