import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';
import 'package:quick_bite/features/auth/widgets/app_divider.dart';
import 'package:quick_bite/features/auth/widgets/app_form_field.dart';
import 'package:quick_bite/features/auth/widgets/bottom_text_button.dart';
import 'package:quick_bite/features/auth/widgets/header_section.dart';
import 'package:quick_bite/features/auth/widgets/login_buttons.dart';
import 'package:quick_bite/features/auth/widgets/rem_forgot.dart';

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
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                          icon: Icons.email_outlined,
                          labelText: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.done,
                          onChanged: (value) {},
                        ),

                        const SizedBox(height: AppSpacing.mLg),

                        AppFormField(
                          controller: _passwordController,
                          focusNode: _passwordFocus,
                          labelText: 'Password',
                          icon: Icons.lock_outline_rounded,
                          suffixIcon: Icons.visibility_outlined,
                          onChanged: (value) {},
                        ),

                        const SizedBox(height: AppSpacing.sm),

                        const RemForgot(),

                        const SizedBox(height: AppSpacing.md),

                        ElevatedButton(onPressed: () {}, child: Text('Login')),
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

                        BottomTextButton(onPressed: () {}),
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
