import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:quick_bite/core/startup/app_asset_preloader.dart';
import 'package:quick_bite/core/theme/app_colors.dart';
import 'package:quick_bite/core/theme/app_spacing.dart';
import 'package:quick_bite/features/splash/provider/splash_ready_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  late final Animation<double> _iconScale;
  late final Animation<double> _iconOpacity;
  late final Animation<double> _titleOpacity;
  late final Animation<double> _subtitleOpacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _iconScale = Tween(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.20, 0.68, curve: Curves.easeOutBack),
      ),
    );

    _iconOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.12, 0.58, curve: Curves.easeOut),
      ),
    );

    _titleOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.52, 0.82, curve: Curves.easeOut),
      ),
    );

    _subtitleOpacity = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.72, 0.96, curve: Curves.easeOut),
      ),
    );

    _controller.forward();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _runStartup();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _runStartup() async {
    try {
      await Future.wait([
        _controller.forward().orCancel,
        AppAssetPreloader.preload(context),
      ]);
    } catch (e) {
      debugPrint('Startup optimization failed: $e');
    }

    if (!mounted) return;

    ref.read(splashReadyProvider.notifier).state = true;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FadeTransition(
              opacity: _iconOpacity,
              child: ScaleTransition(
                scale: _iconScale,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/icons/shopping-bag.svg',
                      width: 64,
                      height: 64,
                      fit: BoxFit.contain,
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            FadeTransition(
              opacity: _titleOpacity,
              child: Text(
                'QuickBite',
                style: textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),

            const SizedBox(height: AppSpacing.sm),

            FadeTransition(
              opacity: _subtitleOpacity,
              child: Text(
                'Fresh food, fast delivery',
                style: textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
