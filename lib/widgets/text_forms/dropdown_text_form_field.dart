import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/core/utils/styles/app_colors.dart';
import 'package:flutter_task/core/utils/styles/app_text_styles.dart';
import 'package:flutter_task/core/utils/ui_helpers/decoration.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_task/features/home/data/models/contacts_model.dart';

class DropdownTextFormField extends HookWidget {
  final String? hintText;
  final List<Category> dropDownList;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;

  const DropdownTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.validator,
    this.textInputType,
    required this.dropDownList
  });


  @override
  Widget build(BuildContext context) {

    return DropDownTextField(
        controller: controller,
        dropDownIconProperty: IconProperty(
          icon: Icons.keyboard_arrow_down,
        ),
        dropDownList: dropDownList.map((category) =>
            DropDownValueModel(
                name: category.name ?? "N/A",
                value: category.id ?? ""
            )
        ).toList(),
        textStyle: AppTextStyles.primaryRegular,
        keyboardType: textInputType,
        textFieldDecoration: InputDecoration(
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
        validator: validator
    );
  }
}
