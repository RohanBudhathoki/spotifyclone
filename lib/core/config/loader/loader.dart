import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:spotifyclone/core/config/theme/app_colors.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitWaveSpinner(color: AppColors.primaryColor, size: 75.0.r),
    );
  }
}
