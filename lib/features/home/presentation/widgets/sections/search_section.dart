import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/styles/app_colors.dart';
import 'package:flutter_task/core/utils/ui_helpers/paddings.dart';
import 'package:flutter_task/core/utils/ui_helpers/radius.dart';
import 'package:flutter_task/core/utils/ui_helpers/spacing.dart';
import 'package:flutter_task/widgets/text_forms/search_text_form_field.dart';
import 'package:go_router/go_router.dart';

class SearchSection extends HookWidget {
  const SearchSection({super.key});

  @override
  Widget build(BuildContext context) {

    final searchController = useTextEditingController();

    return Padding(
        padding: padding16,
        child: Row(
          children: [

            Container(
              width: 58.w,
              height: 58.h,
              decoration: BoxDecoration(
                  borderRadius: radius8,
                  border: .all(
                      color: AppColors.greyLight,
                      width: 1.2.w
                  )
              ),
              child: IconButton(
                onPressed: ()=> context.pop(),
                icon: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: AppColors.grey
                ),
              ),
            ),

            gap6,

            Expanded(
              child: SearchTextFormField(
                controller: searchController,
                onChanged: (value){
                  print("Called ++++");
                },
              ),
            ),
          ],
        )
    );
  }
}
