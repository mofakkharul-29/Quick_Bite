import 'package:flutter/material.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';
import 'package:quick_bite/features/restaurants/widgets/category_item.dart';
import 'package:quick_bite/features/shared/widgets/custom_text.dart';
import 'package:quick_bite/features/shared/widgets/see_all_button.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final List<CategoryItem> categoryList = const <CategoryItem>[
      CategoryItem(
        path: 'assets/images/categories/burger.png',
        bgColor: Color.fromARGB(255, 242, 219, 213),
        name: 'Burger',
      ),
      CategoryItem(
        path: 'assets/images/categories/pizza.png',
        bgColor: Color.fromARGB(255, 222, 221, 221),
        name: 'Pizza',
      ),
      CategoryItem(
        path: 'assets/images/categories/asian.png',
        bgColor: Color.fromARGB(255, 230, 216, 246),
        name: 'Asian',
      ),
      CategoryItem(
        path: 'assets/images/categories/dessert.png',
        bgColor: Color.fromARGB(255, 182, 207, 242),
        name: 'Dessert',
      ),
      CategoryItem(
        path: 'assets/images/categories/drink.png',
        bgColor: Color.fromARGB(255, 244, 164, 178),
        name: 'Drink',
      ),
      CategoryItem(
        path: 'assets/images/categories/coffee.png',
        bgColor: Color.fromARGB(255, 221, 174, 249),
        name: 'Coffee',
      ),
      CategoryItem(
        path: 'assets/images/categories/fast-food.png',
        bgColor: Color.fromARGB(255, 244, 164, 178),
        name: 'Fast Food',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: 'Categories',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            SeeAllButton(text: 'See all', onPressed: () {}),
          ],
        ),
        const SizedBox(height: AppSpacing.md),

        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: AppSpacing.md),
                child: InkWell(
                  onTap: () {
                    debugPrint('clicked');
                  },
                  child: categoryList[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
