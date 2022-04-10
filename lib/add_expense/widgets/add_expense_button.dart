import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../controller/add_expense_controller.dart';

class AddExpenseButton extends StatelessWidget {
  const AddExpenseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddExpenseController controller = Get.find();
    return FloatingActionButton(
      backgroundColor: AppColors.mainColor,
      child: const Icon(Icons.add),
      onPressed: controller.addExpense,
    );
  }
}
