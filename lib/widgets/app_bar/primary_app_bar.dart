import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/styles/app_colors.dart';
import 'package:flutter_task/core/utils/styles/app_text_styles.dart';
import 'package:flutter_task/core/utils/ui_helpers/paddings.dart';
import 'package:flutter_task/core/utils/ui_helpers/radius.dart';
import 'package:flutter_task/core/utils/ui_helpers/spacing.dart';
import 'package:flutter_task/widgets/buttons/custom_icon_button.dart';

/// The main app bar for the application.
class PrimaryAppBar extends HookWidget {

  final TabController tabController;

  const PrimaryAppBar({
    super.key,
    required this.tabController
  });

  @override
  Widget build(BuildContext context) {

    const tabs = ["Contact", "Recent"];
    final selectedIndex = useState<int>(0);

    return Container(
      width: 1.sw,
      padding: padding16,
      child: Row(
        children: [

          SizedBox(
            width: 200.w,
            child: TabBar(
              controller: tabController,
              indicatorSize: .tab,
              indicatorColor: AppColors.primary,
              dividerColor: Colors.transparent,
              onTap: (index)=> selectedIndex.value = index,
              tabs: tabs.map((tab)=> Text(
                tab,
                style: AppTextStyles.primaryRegular.copyWith(
                  fontWeight: selectedIndex.value == tabs.indexOf(tab) ? .bold : null,
                  color: selectedIndex.value == tabs.indexOf(tab) ? AppColors.primary : null
                )
              )).toList(),
            ),
          ),

          const Spacer(),

          CustomIconButton(
              onPressed: (){},
              iconPath: "assets/icons/search_icon.svg"
          ),
          gap8,
          CustomIconButton(
              onPressed: (){},
              iconPath: "assets/icons/menu_icon.svg"
          ),

        ],
      ),
    );
  }
}
