import 'package:flutter/material.dart';

class AppAssetPreloader {
  static const List<String> _assets = [
    'assets/images/login-food.png',
    'assets/images/leaf.png',
    'assets/images/tomato.png',
  ];

  static Future<void> preload(BuildContext context) async {
    try {
      await Future.wait(
        _assets.map((asset) => precacheImage(AssetImage(asset), context)),
      );
    } catch (e) {
      debugPrint('Asset preload failed: $e');
    }
  }
}
