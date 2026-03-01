import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart'; // Make sure to define your AppColors here

class AppTextStyles {

  const AppTextStyles._();

  static TextStyle primaryRegular = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: .w600,
    color: AppColors.textPrimary,
  );

  static TextStyle primaryMedium = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: .w600,
    color: AppColors.textPrimary,
  );

  static TextStyle primarySemiBold = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: .w800,
    color: AppColors.textPrimary,
  );


  static TextStyle secondaryRegular = GoogleFonts.inter(
    fontSize: 14.sp,
    color: AppColors.textSecondary,
  );


  static TextStyle titleLarge = GoogleFonts.inter(
    fontSize: 22.sp,
    fontWeight: .w500,
    color: AppColors.textPrimary,
  );

  static TextStyle titleMedium = GoogleFonts.inter(
    fontSize: 16.sp,
    fontWeight: .w500,
    color: AppColors.textPrimary,
  );

  static TextStyle titleSmall = GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: .w500,
    color: AppColors.textPrimary,
  );

  static TextStyle caption = GoogleFonts.inter(
    fontSize: 8.sp,
    fontWeight: .w600,
    color: AppColors.textSecondary,
  );

}
