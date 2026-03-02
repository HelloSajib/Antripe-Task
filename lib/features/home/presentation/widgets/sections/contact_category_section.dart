
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/extensions/null_empty_extension.dart';
import 'package:flutter_task/core/utils/extensions/status_extension.dart';
import 'package:flutter_task/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_task/features/home/presentation/bloc/home_event.dart';
import 'package:flutter_task/features/home/presentation/widgets/item_view/category_item_view.dart';
import 'package:flutter_task/features/home/presentation/widgets/skeletons/contact_category_skeleton.dart';

class ContactCategorySection extends HookWidget {
  const ContactCategorySection({super.key});

  @override
  Widget build(BuildContext context) {

    void filterContacts(String categoryId){
      context.read<HomeBloc>().add(CategoryBaseFilter(categoryId));
    }

    return SizedBox(
      height: 90.h,
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if(state.status.isLoading){
            return ContactCategorySkeleton();
          }else if (state.status.isSuccess && state.categories.isNotNullAndNotEmpty) {

            return ListView.builder(
              itemCount: state.categories?.length,
              scrollDirection: .horizontal,
              itemBuilder: (context, index) {
                final category = state.categories![index];
                return GestureDetector(
                  onTap: ()=> filterContacts(category.id ?? ""),
                  child: CategoryItemView(
                    imageUrl: state.contactsEntity!.contacts![index].avatarUrl ?? "",
                    categoryName: category.name ?? "N/A",
                    isSelected: state.selectedCtg == category.id,
                  ),
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
