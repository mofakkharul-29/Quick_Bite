import 'package:flutter/material.dart';
import 'package:quick_bite/core/theme/app_colors.dart';

class IconWithText extends StatelessWidget {
  const IconWithText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 110,
          child: Icon(
            Icons.shopping_bag_rounded,
            color: AppColors.primary,
            size: 110,
          ),
        ),

        RichText(
          text: const TextSpan(
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
              fontFamily: 'Poppins',
            ),
            children: <TextSpan>[
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
