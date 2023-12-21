import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api/src/configs/api_client.dart';
import 'package:news_api/src/local/prefs.dart';
import 'package:news_api/src/models/login_model.dart';
import 'package:news_api/src/pages/homePage.dart';
import 'package:news_api/src/widgets/custome_snackbar.dart';

class LoginController extends GetxController {
  Rx<TextEditingController> email = TextEditingController().obs;

  Rx<TextEditingController> password = TextEditingController().obs;

  Rx<LoginModel> loginModel = LoginModel().obs;

  final formkey = GlobalKey<FormState>();

  var token = "".obs;

  var isLoading = false.obs;

  login() async {
    isLoading.value = true;
    await ApiClient.safeApiCall(
      data: {
        "email": email.value.text,
        "password": password.value.text,
      },
      "https://apitest.smartsoft-bd.com/api/login",
      RequestType.post,
      onSuccess: (response) async{
        if (response.statusCode == 200) {
          loginModel.value = LoginModel.fromJson(response.data);
          print(loginModel.value.data);

       
            token.value = response.data["data"]["token"];
            print("tokenn----- $token");
            MySharedPref.saveBoolean(key: 'is-user', value: true);
            MySharedPref.saveString(
                key: 'token', value: response.data["data"]["token"]);
            print("tokenn----- $token");

            CustomSnackBar.showCustomToast(message: "Login Successfully");
            Get.to(HomePage());
          
        }
        isLoading.value = false;
        update();
      },
      onError: (error) {
  final errorMessage = error.response?.data?["message"];

  if (errorMessage != null) {
    CustomSnackBar.showCustomToast(message: errorMessage);

    // Check if the error message indicates an incorrect email or password
    if (errorMessage.contains("email")) {
      CustomSnackBar.showCustomToast(message: "Incorrect email");
    } else if (errorMessage.contains("password")) {
      CustomSnackBar.showCustomToast(message: "Incorrect password");
    } else {
      CustomSnackBar.showCustomToast(message: errorMessage);
    }
  } else {
    // Handle the case where the error or its response is null
    CustomSnackBar.showCustomToast(message: "An error occurred");
  }
},

    );
  }

 
}
