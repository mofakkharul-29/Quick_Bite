import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_bite/features/auth/data/register_form_state.dart';

class RegisterFormNotifier extends Notifier<RegisterFormState> {
  @override
  RegisterFormState build() {
    return RegisterFormState();
  }

  void validateEmail({required String email}) {
    state = state.copyWith(emailError: _validateEmail(email: email));
  }

  void validatePassword({required String password}) {
    state = state.copyWith(
      passwordError: _validatePassword(password: password),
    );
  }

  void validateConfirmPassword({
    required String pass,
    required String confirmPassword,
  }) {
    state = state.copyWith(
      confirmPassError: _validateConfirmPassword(
        pass: pass,
        confirmPassword: confirmPassword,
      ),
    );
  }

  void validateName({required String name}) {
    state = state.copyWith(nameError: _validateName(name));
  }

  void validatePhoneNumber(String? phone) {
    state = state.copyWith(phoneError: _validatePhone(phone));
  }

  String? _validateEmail({required String email}) {
    if (email.isEmpty) {
      return 'Email is required!';
    }

    final RegExp regExp = RegExp(
      r'^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
    );
    if (!regExp.hasMatch(email)) {
      return 'Enter a valid email!';
    }

    return null;
  }

  String? _validatePassword({required String password}) {
    if (password.isEmpty) {
      return 'Password is required!';
    }
    if (password.toString().length < 8) {
      return 'Password must be at least of 8 characters';
    }
    if (!password.contains(RegExp(r'[a-z]'))) {
      return "Password must contain at least one lowercase letter";
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      return "Password must contain at least one numeric character";
    }
    if (!password.contains(RegExp(r'[!@#\$%^&*()<>?/|}{~:]'))) {
      return "Password must contain at least one special character";
    }

    return null;
  }

  String? _validateConfirmPassword({
    required String pass,
    required String confirmPassword,
  }) {
    if (confirmPassword.isEmpty) {
      return 'can\'t be empty!';
    }
    if (pass.toString() != confirmPassword.toString()) {
      return 'Password not match!';
    }
    return null;
  }

  String? _validatePhone(String? phone) {
    if (phone == null || phone.trim().isEmpty) {
      return null;
    }
    final cleanValue = phone.trim();
    final RegExp bdPhoneRegex = RegExp(r'^(?:\+8801|8801|01)[3-9]\d{8}$');

    if (!bdPhoneRegex.hasMatch(cleanValue)) {
      return 'Enter a valid Bangladeshi phone number';
    }

    return null;
  }

  String? _validateName(String name) {
    if (name.trim().isEmpty) {
      return 'Please enter your full name';
    }
    final cleanValue = name.trim();
    if (cleanValue.length < 3) {
      return 'Name must be at least 3 characters long';
    }
    if (cleanValue.length > 50) {
      return 'Name cannot exceed 50 characters';
    }
    return null;
  }
}
