import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quick_bite/features/restaurants/widgets/custom_home_trailing.dart';
import 'package:quick_bite/features/shared/widgets/app_name_text.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/quickbite_icon.svg',
              height: 60,
              width: 60,
              fit: BoxFit.contain,
            ),
            appNameText(context: context),
            const Spacer(),
            //another row with profile photo and notification icon
            const CustomHomeTrailing(),
          ],
        ),
      ],
    );
  }
}
