import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/utils.dart';
import 'widget.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    this.ismargin = true,
  });

  final bool ismargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: simPad(10, 15),
      margin: ismargin
          ? EdgeInsets.only(bottom: AppSizes.spaceBTWitems)
          : simPad(0, 0),
      height: AppHelpers.screenHeight() * 0.08,
      color: AppColors.white,
      child: SearchBar(
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.done,
        elevation: WidgetStatePropertyAll(0),
        leading: Icon(Icons.search, size: 30.sp),
        hintText: 'Search',
        backgroundColor: WidgetStatePropertyAll(Colors.transparent),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: BorderSide(color: AppColors.grey200, width: 1),
        )),
      ),
    );
  }
}
