import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domains/auth_abstract.dart';
import 'auth_provider.dart';
import 'auth_state.dart';

part 'auth_notifier.g.dart';

@Riverpod(keepAlive: true)
class AuthNotifier extends _$AuthNotifier {
  late final AuthRepository _repo;

  @override
  AuthState build() {
    _repo = ref.watch(authRepositoryProvider);

    return AuthState(
      status: _repo.currentUser == null
          ? AuthStatus.unauthenticated
          : AuthStatus.authenticated,
    );
  }

  Future<void> sendOtp(String phoneNumber) async {
    state = state.copyWith(status: AuthStatus.loading);

    await _repo.sendOtp(
      phoneNumber: phoneNumber,
      onCodeSent: (id) {
        state = state.copyWith(
          status: AuthStatus.otpSent,
          verificationId: id,
        );
      },
      onAutoVerified: (_) {
        state = state.copyWith(status: AuthStatus.authenticated);
      },
      onError: (error) {
        state = state.copyWith(
          status: AuthStatus.error,
          errorMessage: error,
        );
      },
    );
  }

  Future<void> verifyOtp(String smsCode) async {
    try {
      await _repo.verifyOtp(
        verificationId: state.verificationId!,
        smsCode: smsCode,
      );

      state = state.copyWith(status: AuthStatus.authenticated);
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> signOut() async {
    await _repo.signOut();
    state = const AuthState(status: AuthStatus.unauthenticated);
  }

  Future<void> signInWithGoogle() async {
    state = state.copyWith(status: AuthStatus.loading);

    try {
      await _repo.signInWithGoogle();
      state = state.copyWith(status: AuthStatus.authenticated);
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.error,
        errorMessage: e.toString(),
      );
    }
  }
}



