import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_bite/core/constants/route_paths.dart';
import 'package:quick_bite/core/theme/app_colors.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';
import 'package:quick_bite/features/auth/providers/auth_controller.dart';
import 'package:quick_bite/features/auth/providers/register_form_status_provider.dart';
import 'package:quick_bite/features/auth/widgets/app_divider.dart';
import 'package:quick_bite/features/auth/widgets/app_form_field.dart';
import 'package:quick_bite/features/auth/widgets/bottom_text_button.dart';
import 'package:quick_bite/features/auth/widgets/header_section.dart';
import 'package:quick_bite/features/auth/widgets/login_buttons.dart';
import 'package:quick_bite/features/shared/widgets/app_snackbar.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;
  late final TextEditingController _fullNameController;
  late final TextEditingController _phoneController;

  late final FocusNode _emailFocus;
  late final FocusNode _passwordFocus;
  late final FocusNode _confirmPasswordFocus;
  late final FocusNode _fullNameFocus;
  late final FocusNode _phoneFocus;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _fullNameController = TextEditingController();
    _phoneController = TextEditingController();

    _emailFocus = FocusNode();
    _passwordFocus = FocusNode();
    _confirmPasswordFocus = FocusNode();
    _fullNameFocus = FocusNode();
    _phoneFocus = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    final formStatus = ref.watch(registerFormStatusProvider);
    final formController = ref.read(registerFormStatusProvider.notifier);
    final asyncAuthController = ref.watch(authControllerProvider);

    ref.listen(authControllerProvider, (previous, next) {
      if (next is AsyncError) {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            AppSnackbar.appSnackbar(
              text: next.error.toString(),
              icon: Icons.error_outline_rounded,
              iconColor: Colors.white,
              textColor: Colors.white,
              backgroundColor: AppColors.error,
            ),
          );
      }
    });

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const HeaderSection(isRegister: true),

                SizedBox(height: AppSpacing.lg),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        AppFormField(
                          controller: _emailController,
                          focusNode: _emailFocus,
                          errorText: formStatus.emailError,
                          icon: Icons.email_outlined,
                          labelText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          onChanged: (value) {
                            formController.validateEmail(email: value);
                          },
                        ),

                        const SizedBox(height: AppSpacing.md),

                        AppFormField(
                          controller: _passwordController,
                          focusNode: _passwordFocus,
                          labelText: 'Password',
                          errorText: formStatus.passwordError,
                          icon: Icons.lock_outline_rounded,
                          obscureText: formStatus.isVisible,
                          suffixIcon: !formStatus.isVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          onChanged: (value) {
                            formController.validatePassword(password: value);
                          },
                          onSuffixTapped: () =>
                              formController.updateVisibility(),
                        ),

                        const SizedBox(height: AppSpacing.md),

                        AppFormField(
                          controller: _confirmPasswordController,
                          focusNode: _confirmPasswordFocus,
                          labelText: 'Confirm Password',
                          errorText: formStatus.confirmPassError,
                          icon: Icons.lock_outline_rounded,
                          obscureText: formStatus.isConfirmPassVisible,
                          suffixIcon: !formStatus.isConfirmPassVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          onChanged: (value) {
                            formController.validateConfirmPassword(
                              pass: _passwordController.text,
                              confirmPassword: value,
                            );
                          },
                          onSuffixTapped: () =>
                              formController.updateConfirmPassVisibility(),
                        ),

                        const SizedBox(height: AppSpacing.md),

                        AppFormField(
                          controller: _fullNameController,
                          focusNode: _fullNameFocus,
                          labelText: 'Full Name',
                          errorText: formStatus.nameError,
                          icon: Icons.person_outline,
                          onChanged: (value) {
                            formController.validateName(name: value);
                          },
                        ),

                        const SizedBox(height: AppSpacing.md),

                        AppFormField(
                          controller: _phoneController,
                          focusNode: _phoneFocus,
                          labelText: 'Phone',
                          errorText: formStatus.phoneError,
                          icon: Icons.phone_android_outlined,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            formController.validatePhoneNumber(value);
                          },
                        ),

                        const SizedBox(height: AppSpacing.md),

                        ElevatedButton(
                          onPressed: asyncAuthController.isLoading
                              ? null
                              : () async {
                                  await ref
                                      .read(authControllerProvider.notifier)
                                      .register(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                        fullName: _fullNameController.text,
                                        phone: _phoneController.text,
                                      );
                                },
                          child: asyncAuthController.isLoading
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                              : Text('Sign Up'),
                        ),

                        const SizedBox(height: AppSpacing.mLg),

                        const AppDivider(),

                        const SizedBox(height: AppSpacing.mLg),

                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            LoginButtons(path: 'assets/icons/google.svg'),
                            LoginButtons(path: 'assets/icons/apple.svg'),
                            LoginButtons(path: 'assets/icons/facebook.svg'),
                          ],
                        ),

                        const SizedBox(height: AppSpacing.mLg),

                        BottomTextButton(
                          isRegister: true,
                          onPressed: () {
                            context.go(loginPath);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
