import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:greep_customer/utils/utils.dart';

import 'widget.dart';

class CustomNumericKeyboard extends StatelessWidget {
  final TextEditingController controller;

  const CustomNumericKeyboard({super.key, required this.controller});

  void _addInput(String value) {
    if (controller.text.length < 6) {
      controller.text += value;
    }
  }

  void _deleteInput() {
    if (controller.text.isNotEmpty) {
      controller.text =
          controller.text.substring(0, controller.text.length - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < 3; i++) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(3, (index) {
              final number = (i * 3) + index + 1;
              return _buildKey(number.toString());
            }),
          ),
          SizedBox(height: 30.h),
        ],
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildKey(""),
            _buildKey("0"),
            _buildDeleteKey(),
          ],
        ),
      ],
    );
  }

  Widget _buildKey(String value) {
    return GestureDetector(
      onTap: value.isNotEmpty ? () => _addInput(value) : null,
      child: Container(
        width: 60.w,
        height: 60.h,
        padding: simPad(5, 10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
        child: Text(
          value,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildDeleteKey() {
    return GestureDetector(
      onTap: _deleteInput,
      child: Container(
        width: 60.w,
        height: 60.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.arrow_back_ios,
          size: 24,
          color: AppColors.red,
        ),
      ),
    );
  }
}
