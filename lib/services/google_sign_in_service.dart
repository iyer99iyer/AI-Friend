import 'package:drift/drift.dart' as drift;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../data/drift_database.dart';

class GoogleSignInService{



  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email',"https://www.googleapis.com/auth/userinfo.profile"]);

  signInWithGoogle() async {

    await googleSignIn.signIn();

    if (googleSignIn.currentUser != null) {

      GoogleSignInAccount googleSignInAccount = googleSignIn.currentUser!;

      MembersCompanion membersCompanion = MembersCompanion(
        emailAddress: drift.Value(googleSignInAccount.email),
        name: drift.Value(googleSignInAccount.displayName!),
        profilePic: drift.Value(googleSignInAccount.photoUrl!),
        // name: googleSignIn.currentUser!.displayName == null ? const drift.Value.absent() : drift.Value(googleSignIn.currentUser!.displayName),
        // profilePicURL: googleSignIn.currentUser?.photoUrl,
      );

      print(membersCompanion.emailAddress);

      return membersCompanion;
    }else{
      return null;
    }
  }

  googleSignOut() async {
    await googleSignIn.disconnect();
  }

}