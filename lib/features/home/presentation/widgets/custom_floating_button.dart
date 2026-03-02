import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/features/home/presentation/widgets/bottom_sheet/add_contact_bottom_sheet.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {

    return Stack(
      alignment: .center,
      children: [
        Image.asset(
          "assets/images/floating_background.png",
          width: 100.w,
          height: 100.h,
        ),
        Positioned(
          bottom: 30,
          right: 25,
          child: IconButton(
              onPressed: ()=> showAddContactBottomSheet(context),
              icon: Icon(
                Icons.add_rounded,
                color: Colors.white,
              )
          ),
        )
      ],
    );
  }
}
