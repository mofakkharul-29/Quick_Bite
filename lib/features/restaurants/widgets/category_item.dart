import 'package:flutter/material.dart';
import 'package:quick_bite/core/theme/app_colors.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';
import 'package:quick_bite/features/shared/widgets/custom_text.dart';

class CategoryItem extends StatelessWidget {
  final Color? bgColor;
  final String path;
  final String name;

  const CategoryItem({
    super.key,
    this.bgColor,
    required this.path,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: bgColor,
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.sm),
            child: Image.asset(path),
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        SizedBox(
          width: 70,
          child: CustomText(
            text: name,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 14,
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
