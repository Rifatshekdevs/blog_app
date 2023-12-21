// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api/src/configs/api_client.dart';
import 'package:news_api/src/local/prefs.dart';
import 'package:news_api/src/models/get_blog_model.dart';
import 'package:news_api/src/widgets/custome_snackbar.dart';

class HomeController extends GetxController {

  // final article = Map().obs;

  var isLoading = false.obs;

  //

  Rx<TextEditingController> title = TextEditingController().obs;
  Rx<TextEditingController> subTitle = TextEditingController().obs;
  Rx<TextEditingController> slug = TextEditingController().obs;
  Rx<TextEditingController> description = TextEditingController().obs;
  Rx<TextEditingController> cId = TextEditingController().obs;

  // late DateTime? publishedAt ;

  //Missing Data Delete Method for Id Null'

  Rx<BloglistModel> getblogmodel = BloglistModel().obs;

  getBlog() async {
    isLoading.value = true;
    await ApiClient.safeApiCall(
      headers: {
        'Authorization':
            'Bearer ${MySharedPref.getToken("token".obs).toString()}',
      },
      "https://apitest.smartsoft-bd.com/api/admin/blog-news",
      RequestType.get,
      onSuccess: (response) {
        print("success");
        if (response.statusCode == 200) {
          getblogmodel.value = BloglistModel.fromJson(response.data);
          print(getblogmodel.value.data);
        }
        isLoading.value = false;
        update();
      },
    );
  }


  addBlog() async {
    await ApiClient.safeApiCall(
      headers: {
        'Authorization':
            'Bearer ${MySharedPref.getToken("token".obs)?.toString()}',
      },
      "https://apitest.smartsoft-bd.com/api/admin/blog-news/store",
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

  @override
  void onInit() {
    getBlog();
    super.onInit();
  }
}
