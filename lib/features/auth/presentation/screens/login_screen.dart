import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';
import 'package:quick_bite/features/auth/widgets/header_section.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sm,
                  ),
                  child: Column(
                    children: [
                      // form fields go here
                    ],
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
