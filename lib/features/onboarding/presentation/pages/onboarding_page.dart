import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/core/utils/styles/app_colors.dart';
import 'package:flutter_task/core/utils/styles/app_text_styles.dart';
import 'package:flutter_task/core/utils/ui_helpers/paddings.dart';
import 'package:flutter_task/core/utils/ui_helpers/spacing.dart';
import 'package:flutter_task/features/home/presentation/pages/home_page.dart';
import 'package:flutter_task/features/onboarding/presentation/cubit/onboarding_cubit.dart';
import 'package:flutter_task/widgets/buttons/primary_button.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends HookWidget {
  static String get path => "/onboarding";
  static String get name => "onboarding";

  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {

    /// Marks onboarding as complete and navigates to the home page.
    void completeOnboarding() {
      context.read<OnboardingCubit>().userIsOnboarded();
      context.pushReplacementNamed(HomePage.name);
    }

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Stack(
            alignment: .topLeft,
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

              Column(
                children: [
                  const Spacer(),
                  SvgPicture.asset(
                    "assets/images/app_logo.svg",
                    width: 126.w,
                    height: 124.w,
                  ),
                  const Spacer(),
                  Container(
                    width: 1.sw,
                    height: 312.h,
                    padding: padding24,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: .vertical(top: Radius.circular(24.r))
                    ),
                    child: Column(
                      crossAxisAlignment: .start,
                      mainAxisAlignment: .center,
                      children: [
                        Text(
                          "Welcome",
                          style: AppTextStyles.titleLarge.copyWith(
                            color: Colors.white
                          ),
                        ),

                        gap12,

                        SizedBox(
                          width: 300.w,
                          child: Text(
                            "Lorem ipsum dolor sit amet consectetur. Pellentesque fames lobortis vestibulum nisi nulla egestas nibh tincidunt nunc.",
                            style: AppTextStyles.secondaryRegular.copyWith(
                                color: Colors.white
                            ),
                          ),
                        ),

                        gap36,

                        PrimaryButton(
                          onPressed: completeOnboarding,
                          text: "Getting Started",
                          background: Colors.white,
                          textColor: AppColors.textPrimary,
                        )
                      ],
                    ),
                  )


                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
