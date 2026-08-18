import 'package:flutter/material.dart';
import 'package:quick_bite/core/theme/app_colors.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';
import 'package:quick_bite/features/auth/widgets/greetings.dart';

class IconWithText extends StatelessWidget {
  const IconWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 100,
          child: Icon(
            Icons.shopping_bag_rounded,
            color: AppColors.primary,
            size: 90,
          ),
        ),

        RichText(
          text: TextSpan(
            style: Theme.of(context).textTheme.headlineMedium,
            children: <TextSpan>[
              const TextSpan(text: 'Quick'),
              TextSpan(
                text: 'Bite',
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium?.copyWith(color: AppColors.primary),
              ),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.lg),

        const Greetings(),
      ],
    );
  }
}
