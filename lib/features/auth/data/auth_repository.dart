import 'dart:io';

import 'package:flutter/rendering.dart';
import 'package:quick_bite/core/network/app_exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final SupabaseClient _supabase;

  AuthRepository(this._supabase);

  Session? get currentSession => _supabase.auth.currentSession;

  Stream<AuthState> get authStateChanges => _supabase.auth.onAuthStateChange;

  Future<Session?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      return response.session;
    } on AuthApiException catch (e) {
      if (e.statusCode == '400' || e.statusCode == '401') {
        throw const InvalidCredentialsExceptions();
      }
      throw const ServerException();
    } on SocketException {
      throw const NetworkException();
    } catch (_) {
      throw const UnknownException();
    }
  }

  Future<Session?> signUp({
    required String email,
    required String password,
    required String fullName,
    String? phone,
  }) async {
    try {
      debugPrint('before hitting signup');
      final AuthResponse response = await _supabase.auth.signUp(
        email: email,
        password: password,
        data: {'full_name': fullName, 'phone': phone},
      );
      debugPrint('after hitting signup');
      debugPrint('name: $fullName\nphone: $phone');
      return response.session;
    } on AuthApiException catch (e) {
      if (e.message.toLowerCase().contains('already registered')) {
        throw const EmailAlreadyInUseException();
      }
      throw const ServerException();
    } on SocketException {
      throw const NetworkException();
    } catch (_) {
      throw const UnknownException();
    }
  }

  Future<Map<String, dynamic>?> getCurrentUserProfile() async {
    try {
      final User? user = _supabase.auth.currentUser;
      if (user == null) return null;

      return await _supabase
          .from('profiles')
          .select()
          .eq('id', user.id)
          .maybeSingle();
    } on PostgrestException {
      throw const ServerException();
    } on SocketException {
      throw const NetworkException();
    } catch (_) {
      throw const UnknownException();
    }
  }

  Future<void> signOut({SignOutScope scope = SignOutScope.global}) async {
    try {
      await _supabase.auth.signOut(scope: scope);
    } catch (_) {
      throw const UnknownException();
    }
  }

  Future<void> deactivateAccount() async {
    try {
      final User? user = _supabase.auth.currentUser;
      if (user == null) {
        return;
      }

      await _supabase
          .from('profiles')
          .update({
            'is_active': false,
            'full_name': 'Deleted User',
            'phone': null,
            'avatar_url': null,
            'updated_at': DateTime.now().toIso8601String(),
          })
          .eq('id', user.id);
      await signOut();
    } on PostgrestException {
      throw const ServerException();
    } on SocketException {
      throw const NetworkException();
    } catch (_) {
      throw const UnknownException();
    }
  }

  String? get accessToken => currentSession?.accessToken;
}
