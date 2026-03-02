import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_task/core/utils/styles/app_colors.dart';
import 'package:flutter_task/core/utils/styles/app_text_styles.dart';
import 'package:flutter_task/core/utils/ui_helpers/decoration.dart';


class PrimaryTextFormField extends HookWidget {
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final VoidCallback? onTap;

  const PrimaryTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.validator,
    this.onTap,
    this.textInputType,
  });


  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      child: TextFormField(
        controller: controller,
        style: AppTextStyles.primaryRegular,
        readOnly: onTap != null,
        keyboardType: textInputType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: AppTextStyles.primaryRegular.copyWith(
              color: AppColors.grey
          ),
          border: primaryInputBorder,
          disabledBorder: primaryInputBorder,
          enabledBorder: primaryInputBorder,
          focusedBorder: primaryInputBorder,
          errorBorder: primaryInputBorder,

        ),
        validator: validator,
      ),
    );
  }
}
