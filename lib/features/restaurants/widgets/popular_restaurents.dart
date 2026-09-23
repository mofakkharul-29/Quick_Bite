import 'package:flutter/material.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';
import 'package:quick_bite/features/shared/widgets/custom_text.dart';
import 'package:quick_bite/features/shared/widgets/restaurant_card.dart';

class PopularRestaurents extends StatelessWidget {
  const PopularRestaurents({super.key});

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: 'Popular Restaurants',
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: AppSpacing.stm),
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
