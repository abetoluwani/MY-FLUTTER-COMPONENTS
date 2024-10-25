// // ignore_for_file: must_be_immutable, depend_on_referenced_packages
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:pinput/pinput.dart';
// import '../utils/utils.dart';


// class OTPTextField extends StatelessWidget {
//   OTPTextField({super.key, this.controller, this.focusNode, this.onCompleted});

//   Color borderColor = AppColors.primary;
//   final TextEditingController? controller;
//   final FocusNode? focusNode;
//   final void Function(String)? onCompleted;

//   @override
//   Widget build(BuildContext context) {
//     final defaultPinTheme = PinTheme(
//       width: 56.w,
//       height: 56.h,
//       textStyle: GoogleFonts.outfit(
//         fontSize: 22,
//         color: AppColors.black,
//       ),
//       decoration: const BoxDecoration(),
//     );

//     final cursor = Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Container(
//           width: 56.w,
//           height: 2.h,
//           decoration: BoxDecoration(
//             color: borderColor,
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//       ],
//     );
//     final preFilledWidget = Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         Container(
//           width: 56.w,
//           height: 2.h,
//           decoration: BoxDecoration(
//             color: AppColors.grey200,
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//       ],
//     );

//     return Pinput(
//       onCompleted: onCompleted,
//       length: 6,
//       pinAnimationType: PinAnimationType.slide,
//       controller: controller,
//       focusNode: focusNode,
//       defaultPinTheme: defaultPinTheme,
//       showCursor: true,
//       cursor: cursor,
//       preFilledWidget: preFilledWidget,
//     );
//   }
// }
