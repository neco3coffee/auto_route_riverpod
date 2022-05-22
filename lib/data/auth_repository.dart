import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

abstract class BaseAuthRepository {
  Stream<User?> get authStateChange;
  Future<void> signInAnonymously();
  Future<void> signOut();
  User? getCurrentUser();
}

final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository(ref.read));

class AuthRepository implements BaseAuthRepository {
  final Reader _reader;

  const AuthRepository(this._reader);

  @override
  // TODO: implement authStateChange
  Stream<User?> get authStateChange =>
      _reader(firebaseAuthProvider).authStateChanges();

  @override
  User? getCurrentUser() => _reader(firebaseAuthProvider).currentUser;

  @override
  Future<void> signInAnonymously() async {
    await _reader(firebaseAuthProvider).signInAnonymously();
  }

  @override
  Future<void> signOut() async {
    await _reader(firebaseAuthProvider).signOut();
  }
}
