import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/styles/app_colors.dart';
import 'package:flutter_task/core/utils/styles/app_text_styles.dart';
import 'package:flutter_task/core/utils/ui_helpers/margins.dart';
import 'package:flutter_task/core/utils/ui_helpers/paddings.dart';
import 'package:flutter_task/core/utils/ui_helpers/radius.dart';
import 'package:flutter_task/core/utils/ui_helpers/spacing.dart';
import 'package:flutter_task/widgets/network_image_widget.dart';

class CategoryItemView extends StatelessWidget {
  final String imageUrl;
  final String categoryName;
  final bool isSelected;

  const CategoryItemView({
    super.key,
    required this.imageUrl,
    required this.categoryName,
    required this.isSelected
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64.w,
      height: 82.h,
      padding: padding4,
      margin: marginRight16,
      child: Column(
        children: [
          Container(
            width: 56.w,
            height: 56.w,
            decoration: isSelected ? BoxDecoration(
              shape: .circle,
              border: .all(
                color: AppColors.primary,
                width: 2.w
              )
            ): null,
            child: NetworkImageWidget(
              imageUrl: imageUrl,
              width: 1.sw,
              height: 1.sh,
              borderRadius: radiusCircle,
            ),
          ),
          gap4,
          Text(
            categoryName,
            maxLines: 1,
            overflow: .ellipsis,
            style: AppTextStyles.secondaryRegular.copyWith(
              color: isSelected ? AppColors.primary : null,
              fontWeight: isSelected ? .bold : null
            ),
          )
        ],
      ),
    );
  }
}
