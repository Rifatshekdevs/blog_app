// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api/src/configs/appColors.dart';
import 'package:news_api/src/controllers/home_controller.dart.dart';
import 'package:news_api/src/widgets/kText.dart';

class AddNewNewsPage extends StatefulWidget {
  @override
  State<AddNewNewsPage> createState() => _AddNewNewsPageState();
}

class _AddNewNewsPageState extends State<AddNewNewsPage> {
  final _formKey = GlobalKey<FormState>();

  final HomeController newsC = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: 'Add News',
          color: black,
          fontFamily: medium,
        ),
      ),
      body: Obx(
        () => Padding(
          padding: padding10,
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                kTextFormField(
                  hintText: 'Title',
                  color: blueGrey,
                  controller: newsC.title.value,
                  validator: 'Title',
                ),
                sizeBox10,
                kTextFormField(
                  hintText: 'SubTitle',
                  color: blueGrey,
                  controller: newsC.subTitle.value,
                  validator: 'SubTitle',
                ),
                sizeBox10,
                kTextFormField(
                  hintText: 'Slug',
                  color: blueGrey,
                  controller: newsC.slug.value,
                  validator: 'Slug',
                ),
                sizeBox10,
                kTextFormField(
                  hintText: 'Description',
                  color: blueGrey,
                  controller: newsC.description.value,
                  validator: 'Description',
                ),
                sizeBox10,
                kTextFormField(
                  hintText: 'Category_id',
                  color: blueGrey,
                  controller: newsC.cId.value,
                  validator: 'Category_id',
                ),
                sizeBox10,
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: InkWell(
          onTap: () {
            newsC.addBlog();
             newsC.getBlog();  // Notify HomePage to refresh news list
            Get.back(result: true); 
          },
          child: Container(
            height: 50,
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: blueGrey,
            ),
            child: Center(
              child: KText(
                text: 'Add News',
                fontFamily: medium,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget kTextFormField({
    required final String hintText,
    // required final String errorText,
    required final Color color,
    required final TextEditingController? controller,
    required final String validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        KText(
          text: validator,
          color: black,
        ),
        TextFormField(
          style: TextStyle(
            fontSize: 12,
            fontFamily: regular,
          ),
          controller: controller,
          validator: (value) {
            if (value == null) {
              return 'Please enter $validator';
            }
            return '';
          },
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: color),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: color),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: red),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: red),
            ),
            // errorText: errorText,
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}
