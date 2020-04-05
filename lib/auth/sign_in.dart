import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String name;
String email;
String imageUrl;
Future<FirebaseUser> signInWithGoogle() async {
  final GoogleSignInAccount googleUser = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final FirebaseUser currentUser = await _auth.signInWithCredential(credential);
  // final FirebaseUser currentUser = authResult.user;
  print("signed in " + currentUser.displayName);
  print("signed in " + currentUser.email);
  return currentUser;
}

// Future<String> signInWithGoogle() async {
//   final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
//   final GoogleSignInAuthentication googleSignInAuthentication =
//       await googleSignInAccount.authentication;

//   final AuthCredential credential = GoogleAuthProvider.getCredential(
//     accessToken: googleSignInAuthentication.accessToken,
//     idToken: googleSignInAuthentication.idToken,
//   );

//   final AuthResult authResult = await _auth.signInWithCredential(credential);
//   final FirebaseUser user = authResult.user;

//   // Checking if email and name is null
//   assert(user.email != null);
//   assert(user.displayName != null);
//   assert(user.photoUrl != null);

//   name = user.displayName;
//   email = user.email;
//   imageUrl = user.photoUrl;

//   // Only taking the first part of the name, i.e., First Name
//   if (name.contains(" ")) {
//     name = name.substring(0, name.indexOf(" "));
//   }

//   assert(!user.isAnonymous);
//   assert(await user.getIdToken() != null);

//   final FirebaseUser currentUser = await _auth.currentUser();
//   assert(user.uid == currentUser.uid);

//   return 'signInWithGoogle succeeded: $user';

//////////////////////////////////////////////////////////////
// SharedPreferences preferences;
// preferences = await SharedPreferences.getInstance();
// if (user != null) {
//   final QuerySnapshot result = await Firestore.instance
//       .collection("users")
//       .where("id", isEqualTo: user.uid)
//       .getDocuments();
//   final List<DocumentSnapshot> documents = result.documents;
//   if (documents.length == 0) {
//     Firestore.instance.collection("users").document(user.uid).setData({
//       "id": user.uid,
//       "username": user.displayName,
//       "photoUrl": user.photoUrl,
//     });
//     print(user);
//     print(email);
//     print(imageUrl);
//     await preferences.setString("id", user.uid);
//     await preferences.setString("username", user.displayName);
//     await preferences.setString("photoUrl", user.photoUrl);
//   } else {
//     await preferences.setString("id", documents[0]['id']);
//     await preferences.setString("username", documents[1]['username']);
//     await preferences.setString("photoUrl", documents[2]['photoUrl']);
//   }
//   Fluttertoast.showToast(msg: "Login was successful");
// } else {}
// }

//////////////////////////////
// GoogleSignIn _googleSignIn = GoogleSignIn(
//   scopes: [
//     'email',
//     'https://www.googleapis.com/auth/contacts.readonly',
//   ],
// );

// Future<void> signInWithGoogle() async {
//   try {
//     await _googleSignIn.signIn();
//   } catch (error) {
//     print(error);
//   }
// }

///////////////////////////////
void signOutGoogle() async {
  await googleSignIn.signOut();

  print("User Sign Out");
}
