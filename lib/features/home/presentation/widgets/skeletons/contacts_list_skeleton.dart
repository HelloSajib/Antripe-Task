import 'package:flutter/material.dart';
import 'package:flutter_task/features/home/presentation/widgets/item_view/contact_item_view.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ContactsListSkeleton extends StatelessWidget {
  const ContactsListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Skeletonizer(
        enabled: true,
        child: ScrollablePositionedList.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return ContactItemView(
                  imageUrl: "",
                  name: "Sajib Hasan",
                  phone: "01988473745"
              );
            }
        ),
      ),
    );
  }
}
