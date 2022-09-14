import 'package:google_sign_in/google_sign_in.dart';

class SignInServices {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount? _user;
  GoogleSignInAccount get user => _user!;
}
