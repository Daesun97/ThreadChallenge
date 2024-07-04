import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get user => _firebaseAuth.currentUser;
  bool get isLogedIn => user != null;

  Stream<User?> authStateChanges() => _firebaseAuth.authStateChanges();

//이메일 비번 firebase와 소통
  Future<void> createAccount(
      {required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> signIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}

final authRepoProvider = Provider(
  (ref) => AuthenticationRepository(),
);

//유저 인증상태 감지
// final authState = StreamProvider(
//   (ref) {
//     final repo = ref.read(authRepoProvider);
//     return repo.authStateChanges();
//   },
// );
