import 'package:flutter/material.dart';
import 'package:quick_bite/core/theme/app_colors.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';

class CardSecondaryInfo extends StatelessWidget {
  const CardSecondaryInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Transform.translate(
          offset: const Offset(-4, 0),
          child: const Icon(
            Icons.location_on_outlined,
            size: 18,
            color: AppColors.textSecondary,
          ),
        ),
        Text(
          'Dhanmondi, Dhaka',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 11),
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: AppSpacing.sm,
            horizontal: AppSpacing.md,
          ),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 219, 248, 220),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            'Open',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 11,
              color: AppColors.success,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
