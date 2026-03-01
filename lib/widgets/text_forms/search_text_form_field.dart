import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/styles/app_colors.dart';
import 'package:flutter_task/core/utils/styles/app_text_styles.dart';
import 'package:flutter_task/core/utils/ui_helpers/decoration.dart';

class SearchTextFormField extends StatelessWidget {

  final TextEditingController controller;
  final Function(String? value) onChanged;

  const SearchTextFormField({
    super.key,
    required this.controller,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {

    return TextFormField(
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: AppTextStyles.primaryRegular.copyWith(
            color: AppColors.grey
        ),
        suffixIcon: IconButton(
            onPressed: (){},
            icon: Icon(
              controller.text.isNotEmpty ? Icons.close : Icons.search,
              color: AppColors.grey,
            )
        ),
        enabledBorder: primaryInputBorder,
        focusedBorder: primaryInputBorder,
        errorBorder: primaryInputBorder,
      ),
      onChanged: onChanged,
    );
  }
}
