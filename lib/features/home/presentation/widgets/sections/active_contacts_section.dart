import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/extensions/null_empty_extension.dart';
import 'package:flutter_task/core/utils/extensions/status_extension.dart';
import 'package:flutter_task/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_task/features/home/presentation/widgets/item_view/active_contact_item_view.dart';

class ActiveContactsSection extends StatelessWidget {
  const ActiveContactsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.h,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.status.isSuccess && state.contacts.isNotNullAndNotEmpty) {
            return ListView.builder(
              itemCount: state.contacts?.length,
              scrollDirection: .horizontal,
              itemBuilder: (context, index) {
                final contact = state.contacts![index];
                return ActiveContactItemView(
                  imageUrl: contact.avatarUrl ?? "",
                  name: contact.name ?? "N/A",
                  isActive: contact.status == "active",
                );
              },
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
