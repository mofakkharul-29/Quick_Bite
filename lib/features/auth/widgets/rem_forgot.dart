import 'package:flutter/material.dart';
import 'package:quick_bite/core/theme/app_colors.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';

class RemForgot extends StatelessWidget {
  const RemForgot({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          child: Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: BoxBorder.all(color: AppColors.border, width: 2.0),
            ),
          ),
        ),

        const SizedBox(width: AppSpacing.sm),

        bodyText(
          text: 'Remember me',
          color: AppColors.textSecondary,
          context: context,
        ),

        const Spacer(),

        TextButton(
          onPressed: () {},
          child: bodyText(
            text: 'Forgot Password?',
            context: context,
            color: AppColors.primaryLight,
          ),
        ),
      ],
    );
  }

  Widget bodyText({
    required String text,
    Color? color,
    required BuildContext context,
  }) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
        fontSize: 16,
        color: color,
        letterSpacing: 0.5,
      ),
    );
  }
}
