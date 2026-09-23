import 'package:flutter/material.dart';
import 'package:quick_bite/core/theme/app_colors.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';
import 'package:quick_bite/features/restaurants/widgets/card_info.dart';
import 'package:quick_bite/features/restaurants/widgets/card_secondary_info.dart';
import 'package:quick_bite/features/shared/widgets/custom_text.dart';

class RestaurantCard extends StatelessWidget {
  final String path;
  final void Function()? onFavouriteTap;
  final void Function()? onTap;

  const RestaurantCard({
    super.key,
    this.onTap,
    required this.path,
    this.onFavouriteTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: 230,
      child: Card(
        elevation: 0.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
          ),
        ),
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 4 / 3,
                    child: Image.asset(
                      path,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: theme.colorScheme.surfaceContainerHigh,
                        child: const Icon(Icons.broken_image_rounded),
                      ),
                    ),
                  ),
                  Positioned(
                    top: AppSpacing.sm,
                    right: AppSpacing.sm,
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.4),
                        shape: BoxShape.circle,
                      ),
                      child: GestureDetector(
                        onTap: onFavouriteTap,
                        behavior: HitTestBehavior.opaque,
                        child: const Icon(
                          Icons.favorite_border_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: AppSpacing.xs),
                    const CustomText(text: 'Burger House'),
                    const SizedBox(height: AppSpacing.sm),
                    const CardInfo(
                      icon: Icons.star_rate_rounded,
                      iconColor: AppColors.primaryLight,
                      fText: '4.6 (1.2k)',
                      deliveryTime: '25 min',
                      priceText: '130',
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    const CardSecondaryInfo(),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.md),
            ],
          ),
        ),
      ),
    );
  }
}
