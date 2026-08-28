import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_bite/features/auth/data/auth_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authPreferencesProvider = Provider<AuthPreferences>(
  (ref) => AuthPreferences(pref: SharedPreferencesAsync()),
);
