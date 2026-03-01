import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/styles/app_colors.dart';
import 'package:flutter_task/core/utils/styles/app_text_styles.dart';
import 'package:flutter_task/core/utils/ui_helpers/paddings.dart';
import 'package:flutter_task/core/utils/ui_helpers/radius.dart';
import 'package:flutter_task/widgets/network_image_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ContactsListSection extends HookWidget {
  const ContactsListSection({super.key});

  @override
  Widget build(BuildContext context) {

    final charScrollController = useMemoized(()=> ItemScrollController());
    final List<String> letters = List.generate(26, (i) => String.fromCharCode(65 + i));

    void scrollTo(int index) {
      charScrollController.scrollTo(
        index: index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: ScrollablePositionedList.builder(
                itemScrollController: charScrollController,
                itemCount: 10,
                itemBuilder: (context,index){
                  return Column(
                    children: [
                      ListTile(
                        onTap: (){},
                        contentPadding: paddingV6,
                        leading: NetworkImageWidget(
                          imageUrl: "https://t3.ftcdn.net/jpg/06/07/84/82/360_F_607848231_w5iFN4tMmtI2woJjMh7Q8mGvgARnzHgQ.jpg",
                          width: 48.w,
                          height: 48.h,
                          borderRadius: radiusCircle,
                        ),
                        title: Text(
                          "Sajib Hasan",
                          style: AppTextStyles.primaryMedium,
                        ),
                        subtitle: Text(
                          "+8801909834142",
                          style: AppTextStyles.secondaryRegular,
                        ),
                      ),
                      Divider(color: AppColors.greyLight, height: 1.h),
                    ],
                  );
                }
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: .center,
              children: List.generate(letters.length, (i) {
                return GestureDetector(
                  //onTap: () => scrollTo(i),
                  child: Padding(
                    padding: padding8,
                    child: Text(
                      letters[i],
                      style: AppTextStyles.caption,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
