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

    // Navigates to home or onboarding page.
    void checkingOnboard(bool alreadyOnboarded) {
      Future.delayed(Duration(seconds: 2),(){
        if(alreadyOnboarded){
          context.go(HomePage.path);
        }else{
          context.go(OnboardingPage.path);
        }
        // Hides the native splash screen.
        FlutterNativeSplash.remove();
      });
    }

    // Navigates when onboarding state changes.
    return BlocListener<OnboardingCubit, bool>(
      listener: (context, state)=> checkingOnboard(state),
      child:  Scaffold(
        backgroundColor: AppColors.background,
        body: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Stack(
            alignment: .center,
            children: [

              Positioned(
                top: -80,
                left: -120,
                child: Container(
                  width: 500.w,
                  height: 500.h,
                  decoration: BoxDecoration(
                      shape: .circle,
                      boxShadow: [
                        BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            blurRadius: 60.r
                        )
                      ]
                  ),
                ),
              ),

              Positioned(
                right: -30,
                top: -30,
                child: Container(
                  width: 160.w,
                  height: 160.h,
                  decoration: BoxDecoration(
                    shape: .circle,
                    color: AppColors.primary,
                  ),
                ),
              ),

              Positioned(
                top: 250,
                child: SvgPicture.asset(
                  "assets/images/app_logo.svg",
                  width: 171.w,
                  height: 168.w,
                ),
              ),

              Positioned(
                left: -120,
                bottom: -120,
                child: Container(
                  width: 353.w,
                  height: 353.h,
                  decoration: BoxDecoration(
                    shape: .circle,
                    color: AppColors.primary,
                  ),
                ),
              )

            ],
          ),
        ),
      )
    );
  }
}
