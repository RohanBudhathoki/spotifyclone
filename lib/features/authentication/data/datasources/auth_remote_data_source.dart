import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spotifyclone/core/error/exception.dart';
import 'package:spotifyclone/features/authentication/data/models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserModel> signupWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });
  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  });
  Future<UserModel?> currentUser();
  Future<void> logout();
  Future<UserModel?> loginwithgoogle();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firestore;

  AuthRemoteDataSourceImpl(this.firebaseAuth, this.firestore);

  @override
  Future<UserModel> loginWithEmailPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user == null) {
        throw const ServerException('User is null');
      }

      final userProfile =
          await firestore
              .collection('users')
              .doc(userCredential.user!.uid)
              .get();
      if (!userProfile.exists) {
        throw const ServerException('User profile not found');
      }

      final userModel = UserModel.fromJson(userProfile.data()!);
      return userModel.copyWith(email: userCredential.user!.email);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> signupWithEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user == null) {
        throw const ServerException('User is null');
      }

      await firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': name,
        'email': email,
      });

      return UserModel(
        id: userCredential.user!.uid,
        email: userCredential.user!.email!,
        name: name,
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel?> currentUser() async {
    try {
      final currentUser = firebaseAuth.currentUser;

      if (currentUser != null) {
        final userProfile =
            await firestore.collection('users').doc(currentUser.uid).get();
        if (userProfile.exists) {
          final userModel = UserModel.fromJson(userProfile.data()!);
          return userModel.copyWith(email: currentUser.email);
        }
      }
      return null;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      throw ServerException('Logout failed: $e');
    }
  }

  @override
  Future<UserModel?> loginwithgoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(credential);
    User? user = userCredential.user;
    if (user != null) {
      await firestore.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'email': user.email,
        'name': user.displayName,
        'photoUrl': user.photoURL,
        'lastSignIn': FieldValue.serverTimestamp(),
      }, SetOptions(merge: true));

      return UserModel(
        id: user.uid,
        name: user.displayName ?? '',
        email: user.email ?? '',
      );
    } else {
      return null;
    }
  }
}
