// import 'package:firebase_auth/firebase_auth.dart';

// class AuthServices {
//   //REGISTRATION
//   Future<String?> registration(
//       {required String email, required String password}) async {
//     try {
//       await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//       return 'success';
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         return 'The password too weak...';
//       } else if (e.code == 'email-already-in-use') {
//         return 'The account already exists';
//       } else {
//         return e.message;
//       }
//     } catch (e) {
//       return e.toString();
//     }
//   }

//   //LOGIN
//   Future<String?> login(
//       {required String email, required String password}) async {
//     try {
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//       return 'success';
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         return 'No user found!!!';
//       } else if (e.code == 'wrong-password') {
//         return 'Incorrect Password';
//       } else {
//         return e.message;
//       }
//     } catch (e) {
//       return e.toString();
//     }
//   }
// }