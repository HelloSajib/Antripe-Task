import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/styles/app_colors.dart';
import 'package:flutter_task/core/utils/ui_helpers/spacing.dart';

class RatingWidget extends StatelessWidget {
  final double rating;
  final int totalReviews;

  const RatingWidget({
    super.key,
    required this.rating,
    required this.totalReviews,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: .start,
      children: [
        Icon(
          Icons.star_rounded,
          size: 20.sp,
          color: AppColors.gold,
        ),
        Text(rating.toStringAsFixed(1)),
        gap8,
        Text("($totalReviews)"),
      ],
    );
  }
}
