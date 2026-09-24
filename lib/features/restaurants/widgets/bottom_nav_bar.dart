import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quick_bite/core/theme/app_colors.dart';
import 'package:quick_bite/features/restaurants/providers/nav_state_provider.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navStateProvider);

    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (value) {
        ref.read(navStateProvider.notifier).onItemTap(value);
      },
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.background,
      elevation: 1.5,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border_outlined),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.today), label: 'Orders'),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}
