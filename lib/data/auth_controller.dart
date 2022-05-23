import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_route_riverpod/data/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, User?>((ref) {
  return AuthController(ref.read)..appStarted();
});

class AuthController extends StateNotifier<User?> {
  final Reader _reader;

  StreamSubscription<User?>? _userStreamSubscription;

  AuthController(this._reader) : super(null) {
    _userStreamSubscription?.cancel();
    _userStreamSubscription = _reader(authRepositoryProvider)
        .authStateChange
        .listen((user) => state = user);
  }

  @override
  void dispose() {
    _userStreamSubscription?.cancel();
    super.dispose();
  }

  void appStarted() {
    final user = _reader(authRepositoryProvider).getCurrentUser();
    if (user != null) {
      state = user;
    }
  }

  void signIn() async {
    await _reader(authRepositoryProvider).signInAnonymously();
  }

  void signOut() async {
    await _reader(authRepositoryProvider).signOut();
  }
}
