import 'package:flutter/material.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';

class AppSnackbar {
  static SnackBar appSnackbar({
    required String text,
    required IconData icon,
    required Color? iconColor,
    required Color? textColor,
    required Color? backgroundColor,
  }) {
    return SnackBar(
      content: Row(
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(text, style: TextStyle(color: textColor)),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(AppSpacing.md),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      duration: const Duration(seconds: 3),
    );
  }
}
