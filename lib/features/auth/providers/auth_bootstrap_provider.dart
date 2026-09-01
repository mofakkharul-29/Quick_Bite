import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_bite/features/auth/data/auth_preferences.dart';
import 'package:quick_bite/features/auth/providers/auth_preference_provider.dart';
import 'package:quick_bite/features/auth/providers/auth_repository_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authBootstrapProvider = FutureProvider<void>((ref) async {
  final AuthPreferences pref = ref.read(authPreferencesProvider);
  final bool isRemember = await pref.getRememberMe();
  final Session? session = ref.read(authRepositoryProvider).currentSession;

  if (!isRemember && session != null) {
    await ref.read(authRepositoryProvider).signOut(scope: SignOutScope.local);
  }
});
