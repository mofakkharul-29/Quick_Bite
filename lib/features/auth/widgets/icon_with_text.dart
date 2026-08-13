import 'package:flutter/material.dart';
import 'package:quick_bite/core/theme/app_colors.dart';

class IconWithText extends StatelessWidget {
  const IconWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.shopping_bag_rounded,
          size: 120,
          color: AppColors.primary,
        ),

        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
              fontFamily: 'Poppins',
            ),
            children: const <TextSpan>[
              TextSpan(text: 'Quick'),
              TextSpan(
                text: 'Bite',
                style: TextStyle(color: AppColors.primaryLight),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
