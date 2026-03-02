import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task/core/utils/extensions/null_empty_extension.dart';
import 'package:flutter_task/core/utils/extensions/status_extension.dart';
import 'package:flutter_task/core/utils/styles/app_colors.dart';
import 'package:flutter_task/core/utils/styles/app_text_styles.dart';
import 'package:flutter_task/core/utils/ui_helpers/paddings.dart';
import 'package:flutter_task/core/utils/ui_helpers/radius.dart';
import 'package:flutter_task/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_task/features/home/presentation/bloc/home_event.dart';
import 'package:flutter_task/features/home/presentation/widgets/empty_contacts_widget.dart';
import 'package:flutter_task/features/home/presentation/widgets/item_view/contact_item_view.dart';
import 'package:flutter_task/features/home/presentation/widgets/skeletons/contacts_list_skeleton.dart';
import 'package:flutter_task/widgets/circle_loading_widget.dart';
import 'package:flutter_task/widgets/error_widget/error_widget.dart';
import 'package:flutter_task/widgets/network_image_widget.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ContactsListSection extends HookWidget {
  const ContactsListSection({super.key});

  @override
  Widget build(BuildContext context) {

    final charScrollController = useMemoized(() => ItemScrollController());
    final List<String> letters = List.generate(
        26, (i) => String.fromCharCode(65 + i));

    void scrollTo(int index) {
      charScrollController.scrollTo(
        index: index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }

    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if(state.status.isLoading){
                  return ContactsListSkeleton();
                }else if(state.status.isSuccess){
                  if(state.contacts.isNotNullAndNotEmpty){

                    return RefreshIndicator(
                      onRefresh: () async => context.read<HomeBloc>().add(GetContacts()),
                      color: AppColors.primary,
                      child: ScrollablePositionedList.builder(
                          itemScrollController: charScrollController,
                          itemCount: state.contacts!.length,
                          itemBuilder: (context, index) {
                            final contact = state.contacts![index];
                            return ContactItemView(
                                imageUrl: contact.avatarUrl ?? "",
                                name: contact.name ?? "N/A",
                                phone: contact.phone ?? "N/A"
                            );
                          }
                      ),
                    );

                  }else{
                    return EmptyContactsWidget();
                  }

                }else if(state.status.isError){
                  return ApiErrorWidget(
                    errorMessage: state.message ?? "Something went wrong",
                    onRetry: ()=> context.read<HomeBloc>().add(GetContacts())
                  );
                }else{
                  return SizedBox.shrink();
                }
              },
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: .center,
              children: List.generate(letters.length, (i) {
                return GestureDetector(
                  //onTap: () => scrollTo(i),
                  child: Padding(
                    padding: padding8,
                    child: Text(
                      letters[i],
                      style: AppTextStyles.caption,
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
