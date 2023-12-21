import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_api/src/configs/appColors.dart';
import 'package:news_api/src/controllers/home_controller.dart.dart';
import 'package:news_api/src/pages/addNewNewsPage.dart';
import 'package:news_api/src/pages/newsDetailsPage.dart';
import 'package:news_api/src/widgets/kText.dart';
import 'package:news_api/src/widgets/notFound.dart';
import 'package:news_api/src/widgets/shammerWidget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeController newsC = Get.put(HomeController());
    newsC.getBlog();
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: black,
            ),
          ),
          title: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              KText(
                text: 'Flutter With ',
                fontSize: 18,
                color: black87,
                fontWeight: FontWeight.w600,
              ),
              KText(
                text: 'Fsd',
                fontSize: 18,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.to(AddNewNewsPage())?.then((value){
                  if (value==true) {
                    newsC.getBlog();   // Refresh news list

                  }
                });
              },
              icon: Icon(
                Icons.add,
              ),
            ),
          ],
        ),
        body: Obx(
          () {

            if (newsC.isLoading.value == false) {
              var blogModel = newsC.getblogmodel.value.data?.blogs?.data;

              if (blogModel != null && blogModel.isNotEmpty) {
                return RefreshIndicator( // refresh data 
                  onRefresh: ()async {
                    await newsC.getBlog();
                  },
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                      padding: padding10,
                      child: ListView.builder(
                        // padding: padding10,
                        shrinkWrap: true,
                        primary: false,
                        scrollDirection: Axis.vertical,
                        itemCount:
                            newsC.getblogmodel.value.data?.blogs?.data?.length,
                        itemBuilder: (BuildContext context, int index) {
                          final allBlog =
                              newsC.getblogmodel.value.data?.blogs?.data?[index];
                          if (allBlog != null) {
                            return GestureDetector(
                              onTap: () => Get.to(
                                NewsDetailsPage(
                                  allNews: allBlog,
                                ),
                              ),
                              child: Container(
                                // height: 350,
                                width: Get.width,
                                margin: EdgeInsets.symmetric(vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: blueGrey.withOpacity(.10)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            "http://via.placeholder.com/400x230",
                                        fit: BoxFit.cover,
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                Center(
                                          child: CircularProgressIndicator(
                                              backgroundColor: Colors.brown,
                                              value: downloadProgress.progress),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Image.network(
                                                'http://via.placeholder.com/400x230'),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 10,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          KText(
                                            text: allBlog.title.toString(),
                                            maxLines: 2,
                                            color: black,
                                            fontFamily: medium,
                                            textAlign: TextAlign.justify,
                                            fontSize: 16,
                                          ),
                                          KText(
                                            text: allBlog.subTitle.toString(),
                                            maxLines: 2,
                                            color: black54,
                                            fontFamily: medium,
                                            textAlign: TextAlign.justify,
                                            fontSize: 12,
                                          ),
                                          KText(
                                            text: allBlog.slug.toString(),
                                            maxLines: 2,
                                            color: black54,
                                            fontFamily: medium,
                                            textAlign: TextAlign.justify,
                                            fontSize: 12,
                                          ),
                                          sizeBox10,
                                          Row(
                                            children: [
                                              KText(
                                                text: 'PublishedAt: ',
                                                maxLines: 3,
                                                color: black54,
                                                fontFamily: regular,
                                                textAlign: TextAlign.justify,
                                                fontSize: 12,
                                              ),
                                              KText(
                                                text: DateFormat('dd-MM-yyyy')
                                                    .format(
                                                        allBlog.date as DateTime),
                                                color: black,
                                                fontFamily: regular,
                                                textAlign: TextAlign.justify,
                                                fontSize: 12,
                                              ),
                                            ],
                                          ),
                                          Divider(
                                            color: Colors.grey.shade200,
                                          ),
                                          KText(
                                            text: allBlog.description.toString(),
                                            maxLines: 3,
                                            color: black54,
                                            fontFamily: regular,
                                            textAlign: TextAlign.justify,
                                            fontSize: 12,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            // handle api ertror
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                );
              } else {
                return SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: padding10,
                    child: NotFound(),
                  ),
                );
              }
            } else {
              return Center(
                child: customShammerView(),
              );
            }
          },
        ));
  }

  customShammerView() {
    return ListView.builder(
        itemCount: 6,
        shrinkWrap: true,
        primary: false,
        itemBuilder: (BuildContext context, int index) {
          return CustomShammerWidget();
        });
  }
}
