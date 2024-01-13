import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: 5.h,
      width: isActive ? 35.w : 20.w,
      decoration: BoxDecoration(
        color: isActive ? AppColors.primary : AppColors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}
