import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/core/utils/styles/app_colors.dart';

class CustomIconButton extends StatelessWidget {
  final String iconPath;
  final double? iconSize;
  final VoidCallback? onPressed;

  const CustomIconButton({
    super.key,
    this.iconSize,
    this.onPressed,
    required this.iconPath,
    });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: SvgPicture.asset(
        iconPath,
        width: iconSize ?? 24.w,
        height: iconSize ?? 24.w,
      ),
    );
  }
}
