import 'package:flutter/material.dart';
import 'package:flutter_task/core/helpers/validation/form_validations.dart';
import 'package:flutter_task/core/utils/styles/app_colors.dart';
import 'package:flutter_task/core/utils/styles/app_text_styles.dart';
import 'package:flutter_task/core/utils/ui_helpers/decoration.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';


class PhoneTextFormField extends HookWidget {
  final String? hintText;
  final TextEditingController? controller;

  const PhoneTextFormField({
    super.key,
    this.controller,
    this.hintText,
  });


  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
      textFieldController: controller,
      textStyle: AppTextStyles.primaryRegular,
      selectorConfig: const SelectorConfig(
        setSelectorButtonAsPrefixIcon: true,
        selectorType: .DROPDOWN,
        useEmoji: true,
      ),
      ignoreBlank: false,
      autoValidateMode: .disabled,
      keyboardType: .phone,
      countries: ["US","BD"],
      inputDecoration: InputDecoration(
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
      onInputChanged: (PhoneNumber phoneNumber) {},
      onInputValidated: (bool isValid) {},
      validator: (value) {
        if (value != null && value.isNotEmpty) {
          return FormValidation(
              validationType: ValidationType.phone,
              formValue: value
          ).validate();
        }
        return null;
      },
    );
  }
}
