import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'add_expense/add_expende_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(1440, 2960),
        splitScreenMode: true,
        builder: () {
          return const GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Finance report',
            home: AddExpensePage(),
          );
        });
  }
}
