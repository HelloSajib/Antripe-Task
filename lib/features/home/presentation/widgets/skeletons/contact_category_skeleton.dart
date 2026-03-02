
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/features/home/presentation/widgets/item_view/category_item_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ContactCategorySkeleton extends HookWidget {
  const ContactCategorySkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: Skeletonizer(
        enabled: true,
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: .horizontal,
          itemBuilder: (context, index) {
            return CategoryItemView(
              imageUrl: "",
              categoryName: "Family",
              isSelected: true,
            );
          },
        ),
      ),
    );
  }
}
