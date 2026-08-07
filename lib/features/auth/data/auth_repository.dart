import 'dart:io';

import 'package:quick_bite/core/network/app_exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  final SupabaseClient _supabase;

  AuthRepository(this._supabase);

  Future<Session?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final AuthResponse response = await _supabase.auth.signInWithPassword(
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
      final AuthResponse response = await _supabase.auth.signUp(
        password: password,
      );
      final User? user = response.user;
      if (user != null) {
        await _supabase.from('profiles').insert({
          'id': user.id,
          'full_name': fullName,
          'phone': phone,
        });
      }
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
}
