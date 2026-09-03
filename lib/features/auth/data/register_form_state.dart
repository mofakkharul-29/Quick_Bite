const Object _unset = Object();

class RegisterFormState {
  final String? emailError;
  final String? passwordError;
  final String? confirmPassError;
  final String? nameError;
  final String? phoneError;
  final bool isVisible;
  final bool isConfirmPassVisible;

  const RegisterFormState({
    this.emailError,
    this.passwordError,
    this.confirmPassError,
    this.nameError,
    this.phoneError,
    this.isVisible = false,
    this.isConfirmPassVisible = false,
  });

  RegisterFormState copyWith({
    Object? emailError = _unset,
    Object? passwordError = _unset,
    Object? confirmPassError = _unset,
    Object? nameError = _unset,
    Object? phoneError = _unset,
    bool? isVisible,
    bool? isConfirmPassVisible,
  }) {
    return RegisterFormState(
      emailError: identical(emailError, _unset)
          ? this.emailError
          : emailError as String?,
      passwordError: identical(passwordError, _unset)
          ? this.passwordError
          : passwordError as String?,
      confirmPassError: identical(confirmPassError, _unset)
          ? this.confirmPassError
          : confirmPassError as String?,
      nameError: identical(nameError, _unset)
          ? this.nameError
          : nameError as String?,
      phoneError: identical(phoneError, _unset)
          ? this.phoneError
          : phoneError as String?,
      isVisible: isVisible ?? this.isVisible,
      isConfirmPassVisible: isConfirmPassVisible ?? this.isConfirmPassVisible,
    );
  }
}
