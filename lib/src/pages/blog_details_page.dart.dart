import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:news_api/src/configs/appColors.dart';
import 'package:news_api/src/controllers/home_controller.dart.dart';
import 'package:news_api/src/controllers/home_details_controller.dart';
import 'package:news_api/src/models/get_blog_model.dart';
import 'package:news_api/src/pages/update_blog_page.dart';
import 'package:news_api/src/widgets/kText.dart';

class BlogDetailsPage extends StatefulWidget {
  final Datum allNews;
  BlogDetailsPage({
    required this.allNews,
  });

  @override
  State<BlogDetailsPage> createState() => _BlogDetailsPageState();
}

class _BlogDetailsPageState extends State<BlogDetailsPage> {
  HomeDetailsController homeDetailsC = Get.put(HomeDetailsController());
  HomeController homeC = Get.put(HomeController());

  @override
  void initState() {
    homeC.getBlog();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    homeC.getBlog();
    return Scaffold(
      appBar: AppBar(
        title: KText(
          text: widget.allNews.title.toString(),
          color: black,
          fontFamily: medium,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.to(UpdateBlogPage(
                id: widget.allNews.id!.toInt(),
                allNews: widget.allNews,
              ))?.then((value) {
                if (value == true) {
                  homeC.getBlog();
                } else {}
              });
              print(widget.allNews.id!.toInt());
            },
            icon: Icon(
              Icons.edit,
              size: 20,
            ),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (c) {
                  return BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: AlertDialog(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          sizeBox10,
                          Text(
                            "Are you Sure to delete ",
                            textAlign: TextAlign.center,
                          ),
                          sizeBox20,
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: KText(text: "NO",color: red,),
                                ),
                              ),
                              SizedBox(width: 15,),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                  homeDetailsC.deleteBlog(widget.allNews.id!.toInt());
                                  Get.back();
                                  Get.back();

                                  },
                                  child: KText(text: "YES",color: red,),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            icon: Icon(
              Icons.delete,
              size: 20,
            ),
          ),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          CachedNetworkImage(
            imageUrl: "http://via.placeholder.com/400x230",
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
              child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                  value: downloadProgress.progress),
            ),
            errorWidget: (context, url, error) =>
                Image.network('http://via.placeholder.com/400x230'),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KText(
                  text: widget.allNews.title.toString(),
                  maxLines: 2,
                  color: black,
                  fontFamily: medium,
                  textAlign: TextAlign.justify,
                  fontSize: 16,
                ),
                sizeBox10,
                KText(
                  text: widget.allNews.subTitle.toString(),
                  maxLines: 2,
                  color: black54,
                  fontFamily: medium,
                  textAlign: TextAlign.justify,
                  fontSize: 12,
                ),
                sizeBox10,
                KText(
                  text: widget.allNews.slug.toString(),
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
                      text: 'PublishedAt:',
                      maxLines: 3,
                      color: black54,
                      fontFamily: regular,
                      textAlign: TextAlign.justify,
                      fontSize: 12,
                    ),
                    KText(
                      text: DateFormat('dd-MM-yyyy')
                          .format(widget.allNews.date as DateTime),
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
                widget.allNews.description != null
                    ? KText(
                        text: widget.allNews.description.toString(),
                        maxLines: 3,
                        color: black54,
                        fontFamily: regular,
                        textAlign: TextAlign.justify,
                        fontSize: 12,
                      )
                    : Container(),
                Divider(
                  color: Colors.grey.shade200,
                ),
                sizeBox20,
                Divider(color: Colors.grey.shade200),
                sizeBox20,
              ],
            ),
          ),
          // recentNews(),
          sizeBox20,
        ],
      ),
    );
  }
}
