import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/styles/app_colors.dart';
import 'package:flutter_task/core/utils/styles/app_text_styles.dart';
import 'package:flutter_task/core/utils/ui_helpers/paddings.dart';
import 'package:flutter_task/core/utils/ui_helpers/radius.dart';
import 'package:flutter_task/widgets/network_image_widget.dart';

class ContactItemView extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String phone;

  const ContactItemView({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.phone
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: (){},
          contentPadding: paddingV6,
          leading: NetworkImageWidget(
            imageUrl: imageUrl,
            width: 48.w,
            height: 48.h,
            borderRadius: radiusCircle,
          ),
          title: Text(
            name,
            style: AppTextStyles.primaryMedium,
          ),
          subtitle: Text(
            phone,
            style: AppTextStyles.secondaryRegular,
          ),
        ),
        Divider(color: AppColors.greyLight, height: 1.h),
      ],
    );
  }
}
