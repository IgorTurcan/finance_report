import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/add_expense_controller.dart';
import 'input_field.dart';
import 'select_field.dart';

class FormFields extends StatelessWidget {
  const FormFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AddExpenseController controller = Get.find();

    return Obx(
      () => Column(
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
    );
  }
}
