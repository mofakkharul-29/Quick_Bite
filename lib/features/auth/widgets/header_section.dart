import 'package:flutter/material.dart';
import 'package:quick_bite/features/auth/widgets/icon_with_text.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        //     //cart with text
        const IconWithText(),
        //     // food on plate photo
        Container(
          height: 120,
          width: 100,
          padding: EdgeInsets.all(2.0),
          child: Image(image: AssetImage('assets/images/login_food.jpg')),
        ),
      ],
    );
  }
}
