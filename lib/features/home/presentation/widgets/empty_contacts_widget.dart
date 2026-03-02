import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/styles/app_colors.dart';
import 'package:flutter_task/core/utils/styles/app_text_styles.dart';
import 'package:flutter_task/core/utils/ui_helpers/margins.dart';
import 'package:flutter_task/core/utils/ui_helpers/paddings.dart';
import 'package:flutter_task/core/utils/ui_helpers/radius.dart';
import 'package:flutter_task/core/utils/ui_helpers/spacing.dart';
import 'package:flutter_task/features/home/presentation/widgets/bottom_sheet/add_contact_bottom_sheet.dart';
import 'package:flutter_task/widgets/buttons/primary_button.dart';

class EmptyContactsWidget extends StatelessWidget {
  const EmptyContactsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: .topCenter,
      child: Container(
        width: 342.w,
        height: 224.h,
        padding: paddingH38,
        margin: .only(top: 68.h),
        decoration: BoxDecoration(
           borderRadius: radius16,
           color: AppColors.primary.withValues(alpha: 0.2)
        ),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text(
              "Ee! No Contacts found.",
              textAlign: .center,
              style: AppTextStyles.titleMedium.copyWith(
                fontSize: 24.sp
              ),
            ),
            gap12,
            PrimaryButton(
              onPressed: ()=> showAddContactBottomSheet(context),
              width: 216.w,
              text: "Add New Contact",
            )
          ],
        ),
      ),
    );
  }
}
