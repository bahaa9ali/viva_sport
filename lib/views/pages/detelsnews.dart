import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva_sport/controllers/news_controller.dart';
import 'package:viva_sport/models/model_news.dart';

class DetailsNews extends GetView<NewsController> {
  const DetailsNews({
    super.key,
    required this.data,
    required this.index,
  });
  final ListModelNews data;
  final int index;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight * 0.35,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      "${data.articles![index].urlToImage}",
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
              width: screenWidth,
              child: Text(
                "${data.articles![index].title}",
                style: const TextStyle(
                    fontSize: 30,
                    fontFamily: 'Cairo',
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: screenHeight,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              padding: const EdgeInsets.all(15.0),
              width: screenWidth,
              child: Text(
                "${data.articles![index].description}",
                style: const TextStyle(
                  fontFamily: 'Cairo',
                  fontSize: 20,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
