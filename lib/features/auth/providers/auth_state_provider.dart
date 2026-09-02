import 'package:flutter/material.dart';
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
          debugPrint('AUTH STATE: no session');
          return AppAuthState.unauthenticated;
        }

        final Map<String, dynamic>? profile = await authRepository
            .getCurrentUserProfile();
        debugPrint('AUTH STATE: profile fetch result = $profile');
        if (profile == null) {
          debugPrint('AUTH STATE: profile is null');
          return AppAuthState.unauthenticated;
        }

        final bool isActive = profile['is_active'] as bool? ?? true;
        debugPrint('AUTH STATE: isActive = $isActive');
        if (!isActive) {
          await authRepository.signOut();
          return AppAuthState.unauthenticated;
        }

        return AppAuthState.authenticated;
      });
    });
