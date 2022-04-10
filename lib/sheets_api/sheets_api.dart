import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:gsheets/gsheets.dart';

import '../models/expense.dart';

class SheetsApi {
  Worksheet? ss;

  SheetsApi();

  Future<void> _initSheet() async {
    final String rawSecret = await rootBundle.loadString('assets/secret/secret.json');
    final GSheets gSheets = GSheets(rawSecret);
    final String rawSheetId = await rootBundle.loadString('assets/secret/gsheet.json');
    final decodedSheetId = json.decode(rawSheetId);
    Spreadsheet sheet = await gSheets.spreadsheet(decodedSheetId['id']);
    ss = sheet.worksheetByTitle('2022');
  }

  Future<Either<String, void>> addRecord(Expense expense) async {
    try {
      await _initSheet();
      await ss?.values.appendRow(expense.toList());
      return const Right(null);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
