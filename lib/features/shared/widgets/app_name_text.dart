import 'package:flutter/material.dart';
import 'package:quick_bite/core/theme/app_colors.dart';

Widget appNameText({required BuildContext context}) {
  return RichText(
    text: TextSpan(
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 26),
      children: <TextSpan>[
        const TextSpan(text: 'Quick'),
        TextSpan(
          text: 'Bite',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: AppColors.primary,
            fontSize: 26,
          ),
        ),
      ],
    ),
  );
}
