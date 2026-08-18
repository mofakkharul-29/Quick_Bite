import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_bite/core/theme/app_colors.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';

class LoginButtons extends StatelessWidget {
  final String path;
  final void Function()? onTap;

  const LoginButtons({super.key, required this.path, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 60,
        width: 100,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppSpacing.md),
          border: Border.all(color: AppColors.border),
        ),
        child: SvgPicture.asset(path, height: 50, width: 50),
      ),
    );
  }
}
