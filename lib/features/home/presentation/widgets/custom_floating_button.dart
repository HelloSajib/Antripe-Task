import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomFloatingButton extends StatelessWidget {
  final VoidCallback onPressed;
  const CustomFloatingButton({
    super.key,
    required this.onPressed
  });

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
              onPressed: onPressed,
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
