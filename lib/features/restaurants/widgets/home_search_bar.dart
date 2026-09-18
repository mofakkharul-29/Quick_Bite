import 'package:flutter/material.dart';
import 'package:quick_bite/core/theme/app_colors.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: 'Search for restaurants or dishes...',
        hintStyle: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(fontSize: 15),
        filled: true,
        fillColor: AppColors.divider,
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: AppSpacing.stm, right: AppSpacing.xxs),
          child: Icon(Icons.search_outlined),
        ),
      ),
      onTapOutside: (PointerDownEvent event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
    );
  }
}
