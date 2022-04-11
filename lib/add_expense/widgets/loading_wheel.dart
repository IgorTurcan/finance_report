import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../constants/app_colors.dart';

class LoadingWheel extends StatelessWidget {
  const LoadingWheel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 0.2.sh,
      width:  0.2.sh,
      child: const LoadingIndicator(
        indicatorType: Indicator.ballRotateChase,
        colors: [
          AppColors.mainColor4,
          AppColors.mainColor3,
          AppColors.mainColor2,
          AppColors.mainColor,
        ],
        strokeWidth: 2,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
