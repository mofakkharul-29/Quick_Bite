import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_bite/features/auth/data/login_form_state.dart';

class LoginFormNotifier extends Notifier<LoginFormState> {
  @override
  LoginFormState build() {
    return LoginFormState();
  }

  void updateEmail({required String value}) {
    state = state.copyWith(emailError: _validateEmail(value));
  }

  void updatePassword({required String value}) {
    state = state.copyWith(passwordError: _validatePassword(value));
  }

  void updateCheckbox() {
    state = state.copyWith(isRemember: !state.isRemember);
  }

  void updateVisibility() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  String? _validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least of 6 characters';
    }

    return null;
  }

  String? _validateEmail(String value) {
    if (value.isEmpty) {
      return 'Email is required!';
    }

    final RegExp regExp = RegExp(
      r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
    );

    if (!regExp.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }
}
