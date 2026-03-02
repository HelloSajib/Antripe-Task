import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/core/utils/styles/app_colors.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_task/features/home/presentation/pages/home_page.dart';
import 'package:flutter_task/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:flutter_task/features/onboarding/presentation/pages/onboarding_page.dart';

class SplashPage extends HookWidget {
  static String get path => "/";
  static String get name => "splash";

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Animation controller for entrance (one-time) + breathe loop
    final animationCtrl = useAnimationController(
      duration: const Duration(milliseconds: 1600),
    );


    // Entrance animations (grow + appear)
    final fastCurve = CurvedAnimation(
      parent: animationCtrl,
      curve: Curves.easeOutCubic,
    );

    final mediumCurve = CurvedAnimation(
      parent: animationCtrl,
      curve: const Interval(0.15, 1.0, curve: Curves.easeOutCubic),
    );

    final slowCurve = CurvedAnimation(
      parent: animationCtrl,
      curve: const Interval(0.3, 1.0, curve: Curves.easeOutCubic),
    );

    final logoAppear = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationCtrl,
        curve: const Interval(0.4, 1.0, curve: Curves.easeOut),
      ),
    );

    final logoScale = Tween<double>(begin: 0.82, end: 1.0).animate(fastCurve);

    // Gentle breathe (scale 1.0 → 1.05 → 1.0)
    final breathe = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(
        parent: animationCtrl,
        curve: Curves.easeInOut,
      ),
    );

    // Staggered circle scales
    final circle1Scale = Tween<double>(begin: 0.0, end: 1.0).animate(slowCurve);     // bottom-left (last)
    final circle2Scale = Tween<double>(begin: 0.0, end: 1.0).animate(mediumCurve);   // top-right
    final circle3Scale = Tween<double>(begin: 0.0, end: 1.0).animate(fastCurve);     // top-left + shadow (first)

    void checkingOnboard(bool alreadyOnboarded) {
      Future.delayed(const Duration(seconds: 4), () {
        if (alreadyOnboarded) {
          context.go(HomePage.path);
        } else {
          context.go(OnboardingPage.path);
        }
        FlutterNativeSplash.remove();
      });
    }


    useEffect(() {
      animationCtrl.forward();

      // After entrance animation finishes → start subtle breathe loop
      Future.delayed(const Duration(milliseconds: 1800), () {
        if (!animationCtrl.isDismissed && context.mounted) {
          animationCtrl.repeat(reverse: true);
        }
      });

      return animationCtrl.dispose;
    }, const []);

    return BlocListener<OnboardingCubit, bool>(
      listener: (context, state) => checkingOnboard(state),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Top-left big shadowed circle (appears first)
              Positioned(
                top: -80,
                left: -120,
                child: ScaleTransition(
                  scale: circle3Scale,
                  child: Container(
                    width: 500.w,
                    height: 500.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          blurRadius: 60.r,
                        )
                      ],
                    ),
                  ),
                ),
              ),

              // Top-right small circle (appears second)
              Positioned(
                right: -30,
                top: -30,
                child: ScaleTransition(
                  scale: circle2Scale,
                  child: Container(
                    width: 160.w,
                    height: 160.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),

              // Bottom-left big circle (appears last)
              Positioned(
                left: -120,
                bottom: -120,
                child: ScaleTransition(
                  scale: circle1Scale,
                  child: Container(
                    width: 353.w,
                    height: 353.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),

              // Logo – fade + scale in, then gentle breathe
              Positioned(
                top: 250,
                child: FadeTransition(
                  opacity: logoAppear,
                  child: ScaleTransition(
                    scale: breathe,
                    child: ScaleTransition(
                      scale: logoScale,
                      child: SvgPicture.asset(
                        "assets/images/app_logo.svg",
                        width: 171.w,
                        height: 168.w,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}