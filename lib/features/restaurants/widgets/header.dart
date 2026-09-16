import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';
import 'package:quick_bite/features/restaurants/widgets/custom_home_trailing.dart';
import 'package:quick_bite/features/shared/widgets/app_name_text.dart';
import 'package:quick_bite/features/shared/widgets/custom_text.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/quickbite_icon.svg',
              height: 40,
              width: 40,
              fit: BoxFit.contain,
              clipBehavior: Clip.hardEdge,
            ),
            const SizedBox(width: AppSpacing.xs),
            appNameText(context: context),
            const Spacer(),
            const CustomHomeTrailing(),
          ],
        ),

        const SizedBox(height: AppSpacing.md),

        CustomText(
          text: 'Good morning, Selim 👋',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppSpacing.xs),
        CustomText(
          text: 'What are you craving today?',
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
        ),
      ],
    );
  }
}
