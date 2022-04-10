import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/expense.dart';
import '../../sheets_api/sheets_api.dart';

class AddExpenseController extends GetxController with StateMixin {
  final String nameLabelText = 'Name*';
  var nameTextEditingController = TextEditingController().obs;

  final String priceLabelText = 'Price*';
  var priceTextEditingController = TextEditingController().obs;

  final String quantityLabelText = 'Quantity*';
  var quantityTextEditingController = TextEditingController().obs;

  final String measureUnitLabelText = 'Unit*';
  final measureUnits = const <String>[
    'kg',
    'liters',
    'pieces',
  ];
  var selectedMeasureUnit = ''.obs;

  final String expenseCategoryLabelText = 'Category*';
  final expenseCategories = const <String>[
    'Mission',
    'Debt',
    'Savings/Investments',
    'Needs (Fixed)',
    'Needs (Variable)',
    'Wants'
  ];
  var selectedExpenseCategory = ''.obs;

  final String providerLabelText = 'Provider';
  var providerTextEditingController = TextEditingController().obs;

  @override
  void onInit() {
    selectedMeasureUnit.value = measureUnits[0];
    selectedExpenseCategory.value = expenseCategories[0];
    change(null, status: RxStatus.success());
    super.onInit();
  }

  void selectUnit(String? option) {
    if (option != null) {
      selectedExpenseCategory.value = option;
    }
  }

  void selectExpenseCategory(String? option) {
    if (option != null) {
      selectedExpenseCategory.value = option;
    }
  }

  Future<void> addExpense() async {
    change(null, status: RxStatus.loading());
    Expense expense = Expense(
      name: nameTextEditingController.value.text,
      price: double.parse(priceTextEditingController.value.text),
      quantity: double.parse(quantityTextEditingController.value.text),
      unit: selectedMeasureUnit.value,
      category: selectedExpenseCategory.value,
      provider: providerTextEditingController.value.text,
    );

    await SheetsApi().addRecord(expense);
    change(null, status: RxStatus.success());
  }
}
