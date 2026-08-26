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
  final IconData? suffixIcon;
  final String labelText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onSuffixTapped;

  const AppFormField({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.labelText,
    this.errorText,
    this.keyboardType,
    this.textInputAction,
    this.suffixIcon,
    this.icon,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.onSuffixTapped,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      onSaved: onSaved,
      focusNode: focusNode,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      obscureText: obscureText,
      dragStartBehavior: DragStartBehavior.start,
      onTapOutside: (_) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 17),
      decoration: InputDecoration(
        errorText: errorText,
        labelText: labelText,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Icon(icon, size: AppSpacing.mLg),
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
          child: IconButton(
            onPressed: onSuffixTapped,
            icon: Icon(suffixIcon),
            highlightColor: const Color(0x00000000),
          ),
        ),
      ),
    );
  }
}
