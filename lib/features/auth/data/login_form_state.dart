const _unset = Object();

class LoginFormState {
  final String? emailError;
  final String? passwordError;
  final bool isRemember;

  const LoginFormState({
    this.emailError,
    this.passwordError,
    this.isRemember = false,
  });

  LoginFormState copyWith({
    Object? emailError = _unset,
    Object? passwordError = _unset,
    bool? isRemember,
  }) {
    return LoginFormState(
      emailError: identical(emailError, _unset)
          ? this.emailError
          : emailError as String?,
      passwordError: identical(passwordError, _unset)
          ? this.passwordError
          : passwordError as String?,
      isRemember: isRemember ?? this.isRemember,
    );
  }
}
