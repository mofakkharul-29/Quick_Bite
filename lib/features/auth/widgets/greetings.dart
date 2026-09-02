import 'package:flutter/material.dart';
import 'package:quick_bite/core/theme/app_colors.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';

class Greetings extends StatelessWidget {
  final bool isRegister;
  const Greetings({super.key, this.isRegister = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isRegister ? 'Welcome!' : 'Welcome Back!',
          style: Theme.of(context).textTheme.headlineLarge,
        ),

        const SizedBox(height: AppSpacing.md),

        Text(
          isRegister
              ? 'Create your account to continue'
              : 'Login to continue to your account.',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 16,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
