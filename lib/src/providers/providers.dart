import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final Provider<FirebaseAuth> firebaseAuthProvider =
    Provider<FirebaseAuth>((ProviderRef<FirebaseAuth> ref) => FirebaseAuth.instance);

final AutoDisposeStreamProvider<User?> authStateChangesProvider = StreamProvider.autoDispose<User?>(
    (AutoDisposeStreamProviderRef<User?> ref) => ref.watch(firebaseAuthProvider).authStateChanges());
