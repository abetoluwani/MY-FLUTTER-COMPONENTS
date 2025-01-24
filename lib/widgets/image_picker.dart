import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../utils/utils.dart';

class ImagePickerAvatar extends StatelessWidget {
  final ImagePickerController controller = Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: controller.pickImage, // Open gallery on tap
      child: Obx(
        () => CircleAvatar(
          radius: 40.r,
          backgroundColor: AppColors.grey.withOpacity(0.5),
          backgroundImage: controller.imageFile.value != null
              ? FileImage(controller.imageFile.value!)
              : null,
          child: controller.imageFile.value == null
              ? Icon(Iconsax.camera, size: 40.r, color: Colors.white)
              : null,
        ),
      ),
    );
  }
}

// class ImagePickerController extends GetxController {
//   var imageFile = Rxn<File>();

//   Future<void> pickImage() async {
//     final pickedFile =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       imageFile.value = File(pickedFile.path);
//     }
//   }
// }

class ImagePickerController extends GetxController {
  var imageFile = Rxn<File>();

  Future<void> pickImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        imageFile.value = File(pickedFile.path);
        print('Image selected: ${pickedFile.path}');
      } else {
        print('No image selected');
      }
    } catch (e) {
      print('Error selecting image: $e');
    }
  }
}
