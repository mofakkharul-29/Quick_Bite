import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_bite/features/auth/providers/auth_preference_provider.dart';
import 'package:quick_bite/features/auth/providers/auth_repository_provider.dart';

final authControllerProvider = AsyncNotifierProvider<AuthController, void>(
  () => AuthController(),
);

class AuthController extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> login({
    required String email,
    required String password,
    required bool isRemember,
  }) async {
    state = const AsyncLoading();

    try {
      final authPreferences = ref.read(authPreferencesProvider);
      final repo = ref.read(authRepositoryProvider);
      await repo.signIn(email: email, password: password);
      await authPreferences.setRememberMe(value: isRemember);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String fullName,
    String? phone,
  }) async {
    state = const AsyncLoading();
    try {
      await ref
          .read(authRepositoryProvider)
          .signUp(
            email: email,
            password: password,
            fullName: fullName,
            phone: phone,
          );
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    try {
      await ref.read(authRepositoryProvider).signOut();
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> deactivateAccount() async {
    state = const AsyncLoading();
    try {
      await ref.read(authRepositoryProvider).deactivateAccount();
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
}
