import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_task/core/utils/styles/app_colors.dart';
import 'package:flutter_task/core/utils/styles/app_text_styles.dart';
import 'package:flutter_task/core/utils/ui_helpers/decoration.dart';

class SearchTextFormField extends HookWidget {
  final TextEditingController controller;
  final Function(String? value) onChanged;

  const SearchTextFormField({
    super.key,
    required this.controller,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    final debounceTimer = useRef<Timer?>(null);

    // Listen to the controller to rebuild only the icon state when text changes
    useListenable(controller);

    // Cleanup timer on dispose
    useEffect(() {
      return () => debounceTimer.value?.cancel();
    }, []);

    void onTextChanged(String value) {
      if (debounceTimer.value?.isActive ?? false) debounceTimer.value!.cancel();
      debounceTimer.value = Timer(Duration(milliseconds: 500), () {
        onChanged(value);
      });
    }

    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: AppTextStyles.primaryRegular.copyWith(
          color: AppColors.grey,
        ),
        suffixIcon: IconButton(
          onPressed: () {
            controller.clear();
            if (debounceTimer.value?.isActive ?? false) debounceTimer.value!.cancel();
            onChanged('');
          },
          icon: Icon(
            controller.text.isNotEmpty ? Icons.close : Icons.search,
            color: AppColors.grey,
          ),
        ),
        enabledBorder: primaryInputBorder,
        focusedBorder: primaryInputBorder,
        errorBorder: primaryInputBorder,
      ),
      onChanged: onTextChanged,
    );
  }
}
