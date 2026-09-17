import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_bite/core/theme/app_colors.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';
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
              height: 45,
              width: 45,
              fit: BoxFit.contain,
              clipBehavior: Clip.hardEdge,
            ),
            const SizedBox(width: AppSpacing.xs),
            appNameText(context: context),
            const Spacer(),
            CircleAvatar(
              backgroundColor: AppColors.border,
              radius: 20,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Image.asset('assets/images/tomato.png'),
              ),
            ),
            const SizedBox(width: AppSpacing.xs),
            IconButton(
              icon: const Icon(Icons.notifications_none_rounded),
              iconSize: 28,
              onPressed: () {},
            ),
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
          style: textTheme.labelLarge?.copyWith(
            color: Colors.grey[700],
            fontSize: 15,
          ),
        ),
      ],
    );
  }
}
