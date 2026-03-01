import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/styles/app_text_styles.dart';
import 'package:flutter_task/core/utils/ui_helpers/margins.dart';
import 'package:flutter_task/core/utils/ui_helpers/paddings.dart';
import 'package:flutter_task/core/utils/ui_helpers/radius.dart';
import 'package:flutter_task/core/utils/ui_helpers/spacing.dart';
import 'package:flutter_task/widgets/network_image_widget.dart';

class ActiveContactsSection extends StatelessWidget {
  const ActiveContactsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: .horizontal,
          itemBuilder: (context, index) {
            return Container(
              width: 64.w,
              height: 82.h,
              padding: padding4,
              margin: marginRight16,
              child: Column(
                children: [
                  NetworkImageWidget(
                    imageUrl: "https://t3.ftcdn.net/jpg/06/07/84/82/360_F_607848231_w5iFN4tMmtI2woJjMh7Q8mGvgARnzHgQ.jpg",
                    width: 56.w,
                    height: 56.h,
                    borderRadius: radiusCircle,
                  ),
                  gap4,
                  Text(
                    "Sajib Hasan",
                    maxLines: 1,
                    overflow: .ellipsis,
                    style: AppTextStyles.secondaryRegular,
                  )
                ],
              ),
            );
          }
      ),
    );
  }
}
