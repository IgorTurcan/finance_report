import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddExpenseController extends GetxController with StateMixin {
  final String nameLabelText = 'Name';
  var nameTextEditingController = TextEditingController().obs;

  final String priceLabelText = 'Price';
  var priceTextEditingController = TextEditingController().obs;

  final String quantityLabelText = 'Quantity';
  var quantityTextEditingController = TextEditingController().obs;

  final String measureUnitLabelText = 'Unit';
  final measureUnits = const <String>[
    'kg',
    'l',
    'pieces',
  ];
  var selectedMeasureUnit = ''.obs;

  final String expenseCategoryLabelText = 'Category';
  final expenseCategories = const <String>[
    'Debt',
    'Mission',
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
}
