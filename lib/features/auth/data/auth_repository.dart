import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final SupabaseClient _supabase;

  AuthRepository(this._supabase);

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    final what = _supabase.auth.signInWithPassword(password: password);
  }
}
