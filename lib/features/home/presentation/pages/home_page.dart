import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task/core/utils/styles/app_colors.dart';
import 'package:flutter_task/core/utils/styles/app_text_styles.dart';
import 'package:flutter_task/core/utils/ui_helpers/paddings.dart';
import 'package:flutter_task/core/utils/ui_helpers/radius.dart';
import 'package:flutter_task/features/home/presentation/widgets/custom_floating_button.dart';
import 'package:flutter_task/features/home/presentation/widgets/sections/active_contacts_section.dart';
import 'package:flutter_task/features/home/presentation/widgets/sections/contact_list_section.dart';
import 'package:flutter_task/widgets/app_bar/primary_app_bar.dart';
import 'package:flutter_task/widgets/network_image_widget.dart';

class HomePage extends HookWidget {

  static String get path => "/home";
  static String get name => "home";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final tabController = useTabController(initialLength: 2);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            PrimaryAppBar(
                tabController: tabController
            ),
            Expanded(
              child: Container(
                width: 1.sw,
                height: 1.sh,
                padding: paddingLeft24,
                child: Column(
                  children: [
                    ActiveContactsSection(),
                    ContactsListSection()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: CustomFloatingButton(),
    );
  }
}

