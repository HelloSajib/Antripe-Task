
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/styles/app_colors.dart';
import 'package:flutter_task/core/utils/styles/app_text_styles.dart';
import 'package:flutter_task/core/utils/ui_helpers/radius.dart';

class PrimaryButton extends StatelessWidget {
  final bool? isLoading;
  final String? text;
  final double? width;
  final Color? textColor;
  final Color? background;
  final Color? strokeColor;
  final VoidCallback? onPressed;

  const PrimaryButton({
    super.key,
    this.isLoading,
    this.text,
    this.width,
    this.textColor,
    this.background,
    this.onPressed,
    this.strokeColor
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width ?? 1.sw,
        height: 56.h,
        alignment: .center,
        decoration: ShapeDecoration(
          color: background ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: radiusCircle,
            side: strokeColor != null ? BorderSide(
              width: 1.w,
              color: strokeColor!
            ):BorderSide.none
          ),
        ),
        child: isLoading == true ?
        const Center(
            child: SizedBox(
                child: CircularProgressIndicator(
                    color: Colors.white
                )
            )
        ) : Text(
          text ?? "Continue",
          style: AppTextStyles.primaryMedium.copyWith(color: textColor ?? Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
