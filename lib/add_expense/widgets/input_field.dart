import 'package:finance_report/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_text_styles.dart';

class InputField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;

  const InputField({Key? key, required this.labelText, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: AppColors.mainColor4,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainColor4, width: 3.w),
          borderRadius: BorderRadius.circular(20.0),
        ),
        labelText: labelText,
        labelStyle: AppTextStyles.standardTextStyle16,
      ),
    );
  }
}
