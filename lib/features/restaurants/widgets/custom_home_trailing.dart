import 'package:flutter/material.dart';
import 'package:quick_bite/core/theme/app_colors.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';

class CustomHomeTrailing extends StatelessWidget {
  const CustomHomeTrailing({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.border,
          radius: 26,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset('assets/images/tomato.png'),
            ),
          ),
        ),

        SizedBox(width: AppSpacing.sm),
        IconButton(
          alignment: Alignment.center,
          icon: Icon(Icons.notifications_none_rounded),
          iconSize: 28,
          onPressed: () {},
        ),
      ],
    );
  }
}
