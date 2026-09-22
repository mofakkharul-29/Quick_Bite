import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';
import 'package:quick_bite/features/restaurants/widgets/category_section.dart';
import 'package:quick_bite/features/restaurants/widgets/home_header.dart';
import 'package:quick_bite/features/restaurants/widgets/home_search_bar.dart';
import 'package:quick_bite/features/restaurants/widgets/popular_restaurents.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HomeHeader(),
                  const SizedBox(height: AppSpacing.lg),
                  const HomeSearchBar(),
                  const SizedBox(height: AppSpacing.lg),
                  const CategorySection(),
                  const SizedBox(height: AppSpacing.sm),
                  const PopularRestaurents(),
                  // const NearbyRestaurents(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
