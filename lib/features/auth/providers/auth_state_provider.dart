import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_bite/features/auth/data/auth_repository.dart';
import 'package:quick_bite/features/auth/providers/auth_repository_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

enum AppAuthState { authenticated, unauthenticated }

final StreamProvider<AppAuthState> authStateProvider =
    StreamProvider<AppAuthState>((ref) {
      final AuthRepository authRepository = ref.watch<AuthRepository>(
        authRepositoryProvider,
      );

      return authRepository.authStateChanges.asyncMap((authState) async {
        final Session? session = authState.session;
        if (session == null) {
          return AppAuthState.unauthenticated;
        }

        final Map<String, dynamic>? profile = await authRepository
            .getCurrentUserProfile();
        if (profile == null) {
          return AppAuthState.unauthenticated;
        }

        final bool isActive = profile['is_active'] as bool? ?? true;
        if (!isActive) {
          await authRepository.signOut();
          return AppAuthState.unauthenticated;
        }

        return AppAuthState.authenticated;
      });
    });
