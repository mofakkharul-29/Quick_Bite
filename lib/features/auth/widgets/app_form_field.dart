import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';

class AppFormField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? errorText;
  final bool obscureText;
  final IconData? icon;
  final String labelText;
  final void Function(String)? onChanged;

  const AppFormField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.labelText,
    this.errorText,
    this.keyboardType,
    this.textInputAction,
    this.icon,
    this.obscureText = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      dragStartBehavior: DragStartBehavior.start,
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 17),
      decoration: InputDecoration(
        errorText: errorText,
        labelText: labelText,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Icon(icon, size: AppSpacing.mLg),
        ),
      ),
      // decoration: InputDecoration(
      //   errorText: errorText,
      //   errorStyle: const TextStyle(
      //     color: AppColors.error,
      //     fontWeight: FontWeight.w400,
      //   ),
      //   label: Text(
      //     labelText,
      //     style: const TextStyle(
      //       color: AppColors.textSecondary,
      //       fontWeight: FontWeight.w400,
      //     ),
      //   ),
      //   prefixIcon: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      //     child: Icon(icon, size: AppSpacing.mLg),
      //   ),
      //   prefixIconColor: AppColors.textSecondary,
      //   contentPadding: const EdgeInsets.symmetric(
      //     vertical: AppSpacing.fieldSize,
      //   ),
      //   enabledBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(AppSpacing.sm),
      //     borderSide: BorderSide(color: AppColors.border, width: 2.0),
      //   ),
      //   focusedBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(AppSpacing.sm),
      //     borderSide: BorderSide(color: AppColors.primaryLight, width: 1.5),
      //   ),

      //   errorBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(AppSpacing.sm),
      //     borderSide: BorderSide(color: AppColors.error, width: 1.5),
      //   ),
      // ),
    );
  }
}
