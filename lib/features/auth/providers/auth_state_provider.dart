import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_bite/features/auth/data/auth_repository.dart';
import 'package:quick_bite/features/auth/providers/auth_repository_provider.dart';

enum AppAuthState { authenticated, unauthenticated }

final StreamProvider<AppAuthState> authStateProvider =
    StreamProvider<AppAuthState>((ref) {
      final AuthRepository authRepository = ref.watch<AuthRepository>(
        authRepositoryProvider,
      );

      return authRepository.authStateChanges.map((authState) {
        return authState.session != null
            ? AppAuthState.authenticated
            : AppAuthState.unauthenticated;
      });
    });
