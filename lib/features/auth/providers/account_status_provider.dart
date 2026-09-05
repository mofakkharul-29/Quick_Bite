import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_bite/features/auth/providers/current_user_profile_provider.dart';

final isAccountActiveProvider = FutureProvider<bool>((ref) async {
  final profile = await ref.watch(currentUserProfileProvider.future);

  if (profile == null) {
    return false;
  }

  return profile['is_active'] as bool? ?? true;
});
