import 'package:flutter/material.dart';

class BottomTextButton extends StatelessWidget {
  final bool isRegister;
  final void Function()? onPressed;
  const BottomTextButton({super.key, this.onPressed, this.isRegister = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isRegister ? 'Already have an account?' : 'Don\'t have an account?',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 16),
        ),

        TextButton(
          onPressed: onPressed,
          style: Theme.of(context).textButtonTheme.style,
          child: Text(
            isRegister ? 'Sign In' : 'Sign Up',
            style: Theme.of(context).textButtonTheme.style?.textStyle
                ?.resolve({})
                ?.copyWith(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
