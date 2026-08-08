import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_bite/features/auth/providers/auth_repository_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum AppAuthState { authenticated, unauthenticated }

final authStateProvider = FutureProvider<AppAuthState>((ref) async {
  final authRepository = ref.watch(authRepositoryProvider);

  final Session? session = authRepository.currentSession;
  if (session == null) {
    return AppAuthState.unauthenticated;
  }

  final profile = await authRepository.getCurrentUserProfile();
  if (profile == null) {
    return AppAuthState.unauthenticated;
  }

  final isActive = profile['is_active'] as bool? ?? true;

  if (!isActive) {
    await authRepository.signOut();
    return AppAuthState.unauthenticated;
  }

  return AppAuthState.authenticated;
});
