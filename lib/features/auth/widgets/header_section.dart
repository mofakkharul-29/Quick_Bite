import 'package:flutter/material.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';
import 'package:quick_bite/features/auth/widgets/icon_with_text.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  static const double _height = 230;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      child: Stack(
        children: [
          const Positioned(left: AppSpacing.md, top: 15, child: IconWithText()),
          Positioned(
            top: 15,
            left: 180,
            child: Image.asset(
              'assets/images/tomato.png',
              height: 50,
              width: 50,
            ),
          ),
          Positioned(
            top: 90,
            left: 160,
            child: Image.asset('assets/images/leaf.png', height: 45, width: 45),
          ),
          Positioned(
            top: 20,
            right: 0,
            child: Image.asset(
              'assets/images/login-food.png',
              width: 180,
              height: 200,
              fit: BoxFit.cover,
              alignment: Alignment.centerLeft,
              excludeFromSemantics: true,
            ),
          ),
        ],
      ),
    );
  }
}
