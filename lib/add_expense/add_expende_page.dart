import 'package:finance_report/add_expense/controller/add_expense_controller.dart';
import 'package:finance_report/add_expense/widgets/input_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/app_colors.dart';
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
        backgroundColor: AppColors.standardColor,
        title: const Text('Finance report'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 100.w, right: 100.w),
          child: Obx(
            () => SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  InputField(
                    labelText: controller.nameLabelText,
                    controller: controller.nameTextEditingController.value,
                  ),
                  SizedBox(height: 60.h),
                  InputField(
                    labelText: controller.priceLabelText,
                    controller: controller.priceTextEditingController.value,
                  ),
                  SizedBox(height: 60.h),
                  Row(
                    children: [
                      SizedBox(
                        width: 0.6.sw,
                        child: InputField(
                          labelText: controller.quantityLabelText,
                          controller: controller.quantityTextEditingController.value,
                        ),
                      ),
                      Expanded(child: Container()),
                      SizedBox(
                        width: 0.25.sw,
                        child: SelectField(
                          labelText: controller.measureUnitLabelText,
                          valueList: controller.measureUnits,
                          selectedValue: controller.selectedMeasureUnit.value,
                          selectCallback: controller.selectedMeasureUnit,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 60.h),
                  SelectField(
                    labelText: controller.expenseCategoryLabelText,
                    valueList: controller.expenseCategories,
                    selectedValue: controller.selectedExpenseCategory.value,
                    selectCallback: controller.selectedExpenseCategory,
                  ),
                  SizedBox(height: 60.h),
                  InputField(
                    labelText: controller.providerLabelText,
                    controller: controller.providerTextEditingController.value,
                  ),
                  // KeyboardContainer(),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: const AddButton(),
    );
  }
}

class KeyboardContainer extends StatelessWidget {
  const KeyboardContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).viewInsets.bottom,
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.standardColor,
      onPressed: () {},
      tooltip: 'Add',
      child: const Icon(Icons.add),
    );
  }
}
