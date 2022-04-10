import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_text_styles.dart';

class SelectField extends StatelessWidget {
  final String labelText;
  final List<String> valueList;
  final String selectedValue;
  final Function(String?) selectCallback;

  const SelectField({
    Key? key,
    required this.labelText,
    required this.valueList,
    required this.selectedValue,
    required this.selectCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 215.h,
      child: FormField<String>(builder: (FormFieldState<String> state) {
        return InputDecorator(
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: AppTextStyles.standardTextStyle16,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              borderRadius: BorderRadius.circular(20.0),
              value: selectedValue,
              elevation: 1,
              style: AppTextStyles.standardTextStyle16,
              onChanged: selectCallback,
              items: valueList.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        );
      }),
    );
  }
}
