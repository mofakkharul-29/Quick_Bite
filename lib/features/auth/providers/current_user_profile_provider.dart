import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_bite/features/auth/data/auth_repository.dart';
import 'package:quick_bite/features/auth/providers/auth_repository_provider.dart';

final currentUserProfileProvider = FutureProvider<Map<String, dynamic>?>((
  ref,
) async {
  final AuthRepository authRepository = ref.watch(authRepositoryProvider);
  return authRepository.getCurrentUserProfile();
});
