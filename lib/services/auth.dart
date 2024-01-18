import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as FireAuth;

import '/models/user.dart';
import '/models/driver.dart';

class AuthService {
  // final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;
  final _auth = FireAuth.FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;


// Convert a Firebase User to a custom User
//   User? _userFromFirebase(firebase_auth.User? user) {
//     return user != null ?
//     User(
//         uid: user.uid,
//         name: '',
//         email: '',
//         phoneNumber: '',
//         icNumber: '',
//         password: '',
//     ) : null;
//   }

// Auth change user stream
//   Stream<User?> get user {
//     return _auth.authStateChanges().map(_userFromFirebase);
//   }

// Sign in anonymously
//   Future<User?> signInAnonymously() async {
//     try {
//       firebase_auth.UserCredential authResult = await _auth.signInAnonymously();
//       User? user = _userFromFirebase(authResult.user);
//       if (user != null) {
//         print('User signed in anonymously with UID: ${user.uid}');
//       }
//       return user;
//     } catch (e) {
//       print('Error signing in anonymously: $e');
//       return null;
//     }
//   }

// Sign in with email and password
  Future<FireAuth.UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    try {
      FireAuth.UserCredential authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return authResult;
    } catch (e) {
      print('Error signing in with email/password: $e');
      return null;
    }
  }

  // Future<void> createUserDocument(String userId, String name, String email, String phoneNumber, String icNumber) async {
  //   try {
  //     await firestore.collection('users').doc(userId).set({
  //       'name': name,
  //       'email': email,
  //       'phoneNumber': phoneNumber,
  //       'icNumber': icNumber,
  //       // Add other fields as necessary
  //     });
  //   } catch (e) {
  //     print('Error writing document: $e');
  //   }
  // }

// Register with email and password
  Future<FireAuth.UserCredential?> registerWithEmailAndPassword(User user) async {
    try {
      FireAuth.UserCredential authResult = await _auth.createUserWithEmailAndPassword(
        email: user.email,
        password: user.password,
      );
      // After successful registration, store additional information in Firestore.
      if (authResult.user != null) {
        firestore.collection("users").add(user.toJson()).then((DocumentReference doc) =>
            print('DocumentSnapshot added with ID: ${doc.id}'));
        // await createUserDocument(authResult.user!.uid, name, email, phoneNumber, icNumber);
      }
      // return _userFromFirebase(authResult.user);
    } catch (e) {
      print('Error registering with email/password: $e');
      return null;
    }
  }


  // Register driver with email and password
  Future<FireAuth.UserCredential?> registerDriverWithEmailAndPassword(Driver driver) async {
    try {
      FireAuth.UserCredential authResult = await _auth.createUserWithEmailAndPassword(
        email: driver.email,
        password: driver.password,
      );
      // After successful registration, store additional driver information in Firestore.
      if (authResult.user != null) {
        firestore.collection("drivers").add(driver.toJson()).then((DocumentReference doc) =>
            print('Driver document added with ID: ${authResult.user!.uid}'));
      }
      return authResult;
    } catch (e) {
      print('Error registering driver: $e');
      return null;
    }
  }


// Sign out method
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  Stream<List<DocumentSnapshot>> getUserOrders(String userId) {
    return firestore.collection('orders')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) => snapshot.docs);
  }


  Future<void> updateOrder(String orderId, Map<String, dynamic> updatedData) async {
    await firestore.collection('orders').doc(orderId).update(updatedData);
  }


  Future<void> deleteOrder(String orderId) async {
    await firestore.collection('orders').doc(orderId).delete();
  }


}