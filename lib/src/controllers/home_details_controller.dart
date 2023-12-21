// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api/src/configs/api_client.dart';
import 'package:news_api/src/controllers/home_controller.dart.dart';
import 'package:news_api/src/local/prefs.dart';
import 'package:news_api/src/widgets/custome_snackbar.dart';

HomeController homeC= Get.put(HomeController());
class HomeDetailsController extends GetxController {
  Rx<TextEditingController> title = TextEditingController().obs;
  Rx<TextEditingController> subTitle = TextEditingController().obs;
  Rx<TextEditingController> slug = TextEditingController().obs;
  Rx<TextEditingController> description = TextEditingController().obs;
  Rx<TextEditingController> cId = TextEditingController().obs;

  editBlog(int id) async {
    await ApiClient.safeApiCall(
      headers: {
        'Authorization':
            'Bearer ${MySharedPref.getToken("token".obs)?.toString()}',
      },
      "https://apitest.smartsoft-bd.com/api/admin/blog-news/update/$id",
      RequestType.post,
      data: {
        "title": title.value.text.trim(),
        "sub_title": subTitle.value.text.trim(),
        "slug": slug.value.text.trim(),
        "description": description.value.text.trim(),
        "category_id": cId.value.text.trim(),
        // "date": DateTime.now(),
      },
      onSuccess: (response) async {
        print("success");
        if (response != null && response.statusCode == 200) {
          CustomSnackBar.showCustomToast(message: response.data?["message"]);
          
          update();
        }
        update();
      },
    );
  }
  deleteBlog(int id) async {
    await ApiClient.safeApiCall(
      headers: {
        'Authorization':
            'Bearer ${MySharedPref.getToken("token".obs)?.toString()}',
      },
      "https://apitest.smartsoft-bd.com/api/admin/blog-news/delete/$id",
      RequestType.delete,
      onSuccess: (response) async {
        print("success");
        if (response != null && response.statusCode == 200) {
          CustomSnackBar.showCustomToast(message: response.data?["message"]);
          Get.back(result: true);
          update();
        }
        update();
      },
    );
  }
}
