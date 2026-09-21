import 'package:flutter/material.dart';
import 'package:quick_bite/core/theme/app_colors.dart';

class SeeAllButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;

  const SeeAllButton({super.key, this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
              fontSize: 16,
            ),
          ),
          const SizedBox(width: 2),
          Icon(
            Icons.chevron_right_outlined,
            size: 20,
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}
