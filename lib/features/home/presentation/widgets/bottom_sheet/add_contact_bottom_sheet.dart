import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/helpers/validation/form_validations.dart';
import 'package:flutter_task/core/utils/styles/app_colors.dart';
import 'package:flutter_task/core/utils/ui_helpers/paddings.dart';
import 'package:flutter_task/core/utils/ui_helpers/radius.dart';
import 'package:flutter_task/core/utils/ui_helpers/spacing.dart';
import 'package:flutter_task/widgets/buttons/primary_button.dart';
import 'package:flutter_task/widgets/text_forms/dropdown_text_form_field.dart';
import 'package:flutter_task/widgets/text_forms/phone_text_form_field.dart';
import 'package:flutter_task/widgets/text_forms/primary_text_form_field.dart';

class AddContactBottomSheet extends HookWidget {
  const AddContactBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {

    final phoneController = useTextEditingController();

    const relations = [
      "Colleague",
      "Manager",
      "Client",
      "Partner",
      "Investor",
      "Service Provider",
      "Vendor",
      "Other",
    ];

    return Container(
      width: 1.sw,
      height: 600.h,
      padding: padding24,
      child: Column(
        children: [
          Container(
            width: 150.w,
            height: 6.h,
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: radius24
            ),
          ),
          gap36,
          PrimaryTextFormField(
            hintText: "Name",
            textInputType: .name,
            validator: (value)=> FormValidation(
              formValue: value,
              validationType: .name
            ).validate()
          ),
          gap16,
          PhoneTextFormField(
            controller: phoneController,
            hintText: "Phone Number",
          ),
          gap16,
          PrimaryTextFormField(
              hintText: "Designation",
              textInputType: .text,
              validator: (value)=> FormValidation(
                  formValue: value,
                  validationType: .required
              ).validate()
          ),
          gap16,
          PrimaryTextFormField(
              hintText: "Company",
              textInputType: .text,
              validator: (value)=> FormValidation(
                  formValue: value,
                  validationType: .required
              ).validate()
          ),
          gap16,
          DropdownTextFormField(
            hintText: "Relation",
            dropDownList: relations
          ),

          gap24,
          PrimaryButton(
            onPressed: (){},
            text: "Save Contact"
          ),
          gap24,
          PrimaryButton(
            onPressed: (){},
            text: "Cancel",
            textColor: AppColors.textGreyLight,
            strokeColor: AppColors.greyLight,
            background: Colors.transparent,
          ),



        ],
      ),
    );
  }
}
