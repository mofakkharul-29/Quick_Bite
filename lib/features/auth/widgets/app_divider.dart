import 'package:flutter/material.dart';
import 'package:quick_bite/core/theme/app_colors.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: getDivider(
            radius: AppSpacing.sm,
            color: const Color(0xFFD6D7DA),
            indent: AppSpacing.sm,
            endIndent: AppSpacing.md,
          ),
        ),
        const Text(
          'or continue with',
          style: TextStyle(color: AppColors.textSecondary, fontSize: 17),
        ),
        Expanded(
          child: getDivider(
            radius: AppSpacing.sm,
            color: const Color(0xFFD6D7DA),
            endIndent: AppSpacing.sm,
            indent: AppSpacing.md,
          ),
        ),
      ],
    );
  }

  Widget getDivider({
    Color? color,
    double? endIndent,
    double? indent,
    required double radius,
  }) {
    return Divider(
      color: color,
      endIndent: endIndent,
      indent: indent,
      thickness: 2.0,
      radius: BorderRadius.circular(radius),
    );
  }
}
