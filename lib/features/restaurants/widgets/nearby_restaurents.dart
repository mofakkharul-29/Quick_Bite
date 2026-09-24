import 'package:flutter/material.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';
import 'package:quick_bite/features/shared/widgets/custom_text.dart';
import 'package:quick_bite/features/shared/widgets/restaurant_card.dart';
import 'package:quick_bite/features/shared/widgets/see_all_button.dart';

class NearbyRestaurents extends StatelessWidget {
  const NearbyRestaurents({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final List<RestaurantCard> cards = <RestaurantCard>[
      RestaurantCard(
        onTap: () {},
        path: 'assets/images/popular_rastaurants/burger.jpg',
        onFavouriteTap: () {},
      ),
      RestaurantCard(
        path: 'assets/images/popular_rastaurants/pizza.jpg',
        onTap: () {},
        onFavouriteTap: () {},
      ),
      RestaurantCard(
        onTap: () {},
        path: 'assets/images/popular_rastaurants/burger.jpg',
        onFavouriteTap: () {},
      ),
      RestaurantCard(
        path: 'assets/images/popular_rastaurants/pizza.jpg',
        onTap: () {},
        onFavouriteTap: () {},
      ),
    ];

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: 'Nearby Restaurants',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SeeAllButton(text: 'See all', onPressed: () {}),
          ],
        ),
        const SizedBox(height: AppSpacing.md),

        SizedBox(
          height: 276,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cards.length,
            itemBuilder: (context, index) {
              final isLast = index == cards.length - 1;
              return Padding(
                padding: EdgeInsets.only(right: isLast ? 0 : AppSpacing.md),
                child: cards[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
