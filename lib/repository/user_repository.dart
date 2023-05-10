import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:responsive_dashboard/style/pallete.dart';

import '../feature/UserModel.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  //Points to the database
  final _db = FirebaseFirestore.instance;

  _createUser(UserModel user) async {
    await _db.collection("Users").add(user.toJson()).whenComplete(() {
      Get.snackbar("Success", "Your account has been created",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColor.greenSubtleHK,
          colorText: AppColor.greenHK);
    }).catchError((error, StackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColor.redSubtleHK,
          colorText: AppColor.redHK);
          print("Error - $error");
    });
  }
}
