import 'package:flutter/material.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';
import 'package:quick_bite/features/auth/widgets/icon_with_text.dart';

class HeaderSection extends StatelessWidget {
  final bool isRegister;
  const HeaderSection({super.key, this.isRegister = false});

  static const double _height = 270;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      child: Stack(
        children: [
          Positioned(
            left: AppSpacing.md,
            top: 15,
            child: IconWithText(isRegister: isRegister),
          ),

          Positioned(
            top: 10,
            left: 250,
            child: Image.asset(
              'assets/images/tomato.png',
              height: 50,
              width: 50,
            ),
          ),

          Positioned(
            top: 80,
            left: 230,
            child: Image.asset('assets/images/leaf.png', height: 45, width: 45),
          ),

          Positioned(
            top: 20,
            right: 0,
            child: Image.asset(
              'assets/images/login-food.png',
              width: 110,
              height: 180,
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
