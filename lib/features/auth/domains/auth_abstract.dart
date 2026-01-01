import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository {
  User? get currentUser;

  Future<void> signInWithGoogle();
  Future<void> signOut();


  Future<void> sendOtp({
    required String phoneNumber,
    required Function(String verificationId) onCodeSent,
    required Function(String error) onError,
    required Function(UserCredential credential) onAutoVerified,
  });

  Future<void> verifyOtp({
    required String verificationId,
    required String smsCode,
  });
}
