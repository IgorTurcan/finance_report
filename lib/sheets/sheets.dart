import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:gsheets/gsheets.dart';

class Sheets {
  Worksheet? ss;

  Sheets();

  initSheet() async {
    final rawSecret = await rootBundle.loadString('assets/secret/secret.json');
    final gsheets = GSheets(rawSecret);
    final rawSheet = await rootBundle.loadString('assets/secret/gsheet.json');
    final decodedSheet = json.decode(rawSheet);
    Spreadsheet sheet = await gsheets.spreadsheet(decodedSheet['id']);
    ss = sheet.worksheetByTitle('2022');
  }

  addRecord() async {
      await initSheet();
      final secondRow = ['5', 'f', '6', 'f6', 'f6', ' f6', 'f6'];
      await ss?.values.appendRow(secondRow);
  }
}
