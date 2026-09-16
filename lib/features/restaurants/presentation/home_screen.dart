import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';
import 'package:quick_bite/features/restaurants/widgets/header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AppSpacing.sm),
            child: SingleChildScrollView(
              child: Column(children: [HomeHeader()]),
            ),
          ),
        ),
      ),
    );
  }
}
