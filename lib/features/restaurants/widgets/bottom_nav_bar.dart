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
        BottomNavigationBarItem(
          icon: Icon(
            currentIndex == 0 ? Icons.home_filled : Icons.home_outlined,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            currentIndex == 1
                ? Icons.favorite_rounded
                : Icons.favorite_border_outlined,
          ),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            currentIndex == 2
                ? Icons.assignment_rounded
                : Icons.assignment_outlined,
          ),
          label: 'Orders',
        ),
        BottomNavigationBarItem(
          icon: Icon(currentIndex == 3 ? Icons.person : Icons.person_outline),
          label: 'Profile',
        ),
      ],
    );
  }
}
