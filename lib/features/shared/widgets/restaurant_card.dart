import 'package:flutter/material.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';
import 'package:quick_bite/features/shared/widgets/custom_text.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      width: 230,
      child: Card(
        elevation: 0.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(16),
          side: BorderSide(
            color: theme.colorScheme.outlineVariant.withValues(alpha: 0.5),
          ),
        ),
        child: InkWell(
          onTap: () {},
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      'assets/images/popular_rastaurants/burger.jpg',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        color: theme.colorScheme.surfaceContainerHigh,
                        child: const Icon(Icons.broken_image_rounded),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 1,
                    right: 5,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.black.withValues(alpha: 0.3),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        icon: const Icon(
                          Icons.favorite_border_rounded,
                          color: Colors.white,
                          size: 18,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: AppSpacing.sm,
                ),
                child: Column(
                  children: [
                    CustomText(text: 'Burger House'),
                    // rating, //time // tk
                    //location,    //open
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
            ],
          ),
        ),
      ),
    );
  }
}
