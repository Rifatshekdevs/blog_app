// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_api/src/configs/appColors.dart';
import 'package:news_api/src/controllers/home_controller.dart.dart';
import 'package:news_api/src/controllers/home_details_controller.dart';
import 'package:news_api/src/models/get_blog_model.dart';
import 'package:news_api/src/widgets/kText.dart';

class UpdateBlogPage extends StatefulWidget {
  final Datum allNews;
  final int id;
  UpdateBlogPage({
    required this.allNews, required this.id,
  });

  @override
  State<UpdateBlogPage> createState() => _UpdateBlogPageState();
}

class _UpdateBlogPageState extends State<UpdateBlogPage> {


  @override
  void initState() {
    homeDetailsC.title.value.text = widget.allNews.title.toString();
    homeDetailsC.subTitle.value.text = widget.allNews.subTitle.toString();
    homeDetailsC.slug.value.text = widget.allNews.slug.toString();
    homeDetailsC.description.value.text = widget.allNews.description.toString();
    homeDetailsC.cId.value.text = widget.allNews.categoryId.toString();
    homeC.getBlog();
    super.initState();
  }

  //
  final _formKey = GlobalKey<FormState>();

      HomeController homeC= Get.put(HomeController());
      HomeDetailsController homeDetailsC= Get.put(HomeDetailsController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: 'Update News',
          color: black,
          fontFamily: medium,
        ),
      ),
      body: Obx(
        ()=> Padding(
          padding: padding10,
          child: Form(
            key: _formKey,
            child: ListView(
                children: [
                  kTextFormField(
                    hintText: 'Title',
                    color: blueGrey,
                    controller: homeDetailsC.title.value,
                    validator: 'Title',
                  ),
                  sizeBox10,
                  kTextFormField(
                    hintText: 'SubTitle',
                    color: blueGrey,
                    controller: homeDetailsC.subTitle.value,
                    validator: 'SubTitle',
                  ),
                  sizeBox10,
                  kTextFormField(
                    hintText: 'Slug',
                    color: blueGrey,
                    controller: homeDetailsC.slug.value,
                    validator: 'Slug',
                  ),
                  sizeBox10,
                  kTextFormField(
                    hintText: 'Description',
                    color: blueGrey,
                    controller:homeDetailsC.description.value,
                    validator: 'Description',
                  ),
                  sizeBox10,
                  kTextFormField(
                    hintText: 'Category_id',
                    color: blueGrey,
                    controller: homeDetailsC.cId.value,
                    validator: 'Category_id',
                  ),
                  sizeBox10,
                  SizedBox(height: 100),
                ],
              ),
          ),
        ),
      ),
      // resizeToAvoidBottomInset: false,
      bottomSheet: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: InkWell(
          onTap: () {
            homeDetailsC.editBlog(widget.id.toInt());
            homeC.getBlog();
            Get.back(result: true);  
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
                text: 'Update News',
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
    required final TextEditingController controller,
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
