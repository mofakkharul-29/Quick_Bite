import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quick_bite/core/constants/route_paths.dart';
import 'package:quick_bite/core/theme/app_colors.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';

class RemForgot extends StatelessWidget {
  final void Function(bool?)? onChanged;
  final bool value;
  const RemForgot({super.key, this.onChanged, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          checkColor: AppColors.background,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(4),
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
          onPressed: () {
            context.go(forgotPasswordPath);
          },
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
