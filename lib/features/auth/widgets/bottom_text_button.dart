import 'package:flutter/material.dart';

class BottomTextButton extends StatelessWidget {
  final void Function()? onPressed;
  const BottomTextButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account?',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 16),
        ),

        TextButton(
          onPressed: onPressed,
          style: Theme.of(context).textButtonTheme.style,
          child: Text(
            'Sign Up',
            style: Theme.of(context).textButtonTheme.style?.textStyle
                ?.resolve({})
                ?.copyWith(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
