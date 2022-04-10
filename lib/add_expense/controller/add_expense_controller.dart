import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gsheets/gsheets.dart';

import '../../sheets/sheets.dart';

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
    readJson();
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

  Future<void> readJson() async {
    var s = Sheets();
    await s.addRecord();
  }
}
