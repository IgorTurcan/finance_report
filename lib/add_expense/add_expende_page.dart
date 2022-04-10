import 'package:finance_report/add_expense/controller/add_expense_controller.dart';
import 'package:finance_report/add_expense/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../constants/app_colors.dart';
import 'widgets/add_expense_button.dart';
import 'widgets/form_fields.dart';
import 'widgets/loading_wheel.dart';
import 'widgets/select_field.dart';

class AddExpensePage extends StatelessWidget {
  const AddExpensePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => AddExpenseController());
    AddExpenseController controller = Get.find();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text('Finance report'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 100.w, right: 100.w),
          child: SingleChildScrollView(
            child: controller.obx(
              (_) => const FormFields(),
              onLoading: const LoadingWheel(),
            ),
          ),
        ),
      ),
      floatingActionButton: const AddExpenseButton(),
    );
  }
}
