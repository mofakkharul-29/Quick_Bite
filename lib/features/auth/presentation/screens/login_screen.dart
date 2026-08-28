import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_bite/core/constants/route_paths.dart';
import 'package:quick_bite/core/theme/app_colors.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';
import 'package:quick_bite/features/auth/providers/auth_controller.dart';
import 'package:quick_bite/features/auth/providers/login_form_status_provider.dart';
import 'package:quick_bite/features/auth/widgets/app_divider.dart';
import 'package:quick_bite/features/auth/widgets/app_form_field.dart';
import 'package:quick_bite/features/auth/widgets/bottom_text_button.dart';
import 'package:quick_bite/features/auth/widgets/header_section.dart';
import 'package:quick_bite/features/auth/widgets/login_buttons.dart';
import 'package:quick_bite/features/auth/widgets/rem_forgot.dart';
import 'package:quick_bite/features/shared/widgets/app_snackbar.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final FocusNode _emailFocus;
  late final FocusNode _passwordFocus;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _emailFocus = FocusNode();
    _passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final formStatus = ref.watch(loginFormStatusProvider);
    final formNotifier = ref.read(loginFormStatusProvider.notifier);
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
                const HeaderSection(),

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
                            formNotifier.updateEmail(value: value);
                          },
                        ),

                        const SizedBox(height: AppSpacing.mLg),

                        AppFormField(
                          controller: _passwordController,
                          focusNode: _passwordFocus,
                          labelText: 'Password',
                          errorText: formStatus.passwordError,
                          icon: Icons.lock_outline_rounded,
                          obscureText: formStatus.isPasswordVisible,
                          suffixIcon: !formStatus.isPasswordVisible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          onChanged: (value) {
                            formNotifier.updatePassword(value: value);
                          },
                          onSuffixTapped: () => formNotifier.updateVisibility(),
                        ),

                        const SizedBox(height: AppSpacing.sm),

                        RemForgot(
                          onChanged: (_) {
                            formNotifier.updateCheckbox();
                          },
                          value: formStatus.isRemember,
                        ),

                        const SizedBox(height: AppSpacing.md),

                        ElevatedButton(
                          onPressed: asyncAuthController.isLoading
                              ? null
                              : () async {
                                  await ref
                                      .read(authControllerProvider.notifier)
                                      .login(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                        isRemember: formStatus.isRemember,
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
                              : Text('Login'),
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

                        const SizedBox(height: AppSpacing.md),

                        BottomTextButton(
                          onPressed: () {
                            context.go(registerPath);
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
