import 'package:flutter/material.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';
import 'package:quick_bite/features/shared/widgets/custom_text.dart';
import 'package:quick_bite/features/shared/widgets/restaurant_card.dart';

class PopularRestaurents extends StatelessWidget {
  const PopularRestaurents({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'Popular Restaurants',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppSpacing.stm),
        RestaurantCard(),
      ],
    );
    // return Column(
    //   crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //     CustomText(
    //       text: 'Popular Restaurants',
    //       style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
    //     ),
    //   ],
    // );
  }
}
