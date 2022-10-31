import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:viva_sport/bindings/news_binding.dart';
import 'package:viva_sport/models/model_news.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:viva_sport/views/pages/detelsnews.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../../controllers/news_controller.dart';
import '../../services/api_news.dart';
import '../widgets/news/imagecard.dart';

class NewsPage extends GetView<NewsController> {
  NewsPage({Key? key}) : super(key: key);

  @override
  var controller = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: NewsServicesApi().getDataApiNews(),
          builder: (context, AsyncSnapshot snapshot) {
            late ListModelNews data = snapshot.data;
            if (snapshot.hasData) {
              return ListView(
                children: [
                  SizedBox(
                    child: GestureDetector(
                      onTap: () {
                        Get.to(
                          () => DetailsNews(
                            data: data,
                            index: controller.index,
                          ),
                        );
                      },
                      child: SizedBox(
                          height: screenHeight * 0.50,
                          child: Swiper(
                            onIndexChanged: (value) {
                              controller.index = value;
                            },
                            itemCount: 10,
                            autoplay: true,
                            autoplayDelay: 8000,
                            itemHeight: screenHeight - 2 * 64,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Stack(
                                children: [
                                  ImageCard(
                                    screenHeight: screenHeight,
                                    screenWidth: screenWidth,
                                    data: data,
                                    index: index,
                                  ),
                                ],
                              ),
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(top: 8, bottom: 8, right: 20),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "اخر الأخبار",
                          style: TextStyle(
                            fontFamily: 'Cairo',
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    //  physics: NeverScrollableScrollPhysics(),
                    primary: false,
                    shrinkWrap: true,
                    itemCount: data.articles!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          controller.changeindex(index);
                          Get.to(
                            () => DetailsNews(
                                data: data, index: controller.index),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          elevation: 12,
                          shadowColor: Colors.pink,
                          margin:
                              const EdgeInsets.only(top: 10, left: 8, right: 8),
                          child: Container(
                            height: screenHeight * 0.20,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.black,
                            ),
                            child: Row(
                              children: [
                                Flexible(
                                  flex: 3,
                                  child: Container(
                                    margin: const EdgeInsets.only(left: 10),
                                    height: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "${data.articles![index].urlToImage}"),
                                          fit: BoxFit.fitHeight),
                                    ),
                                  ),
                                ),
                                //
                                Flexible(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        textDirection: TextDirection.rtl,
                                        children: [
                                          Text(
                                            "${data.articles![index].title}",
                                            style: const TextStyle(
                                              fontFamily: 'Cairo',
                                            ),
                                            overflow: TextOverflow.clip,
                                            textAlign: TextAlign.right,
                                            maxLines: 2,
                                          ),
                                          const SizedBox(height: 20),
                                          Text(
                                            "${data.articles![index].description}",
                                            style: const TextStyle(
                                                fontFamily: 'Cairo',
                                                color: Colors.grey,
                                                fontSize: 12),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.right,
                                            maxLines: 2,
                                          ),
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              );
            } else {
              return const Center(
                  child: SizedBox(
                height: 100,
                width: 100,
                child: LoadingIndicator(
                  indicatorType: Indicator.ballRotateChase,

                  /// Required, The loading type of the widget
                  colors: [
                    Colors.white,
                  ],

                  /// Optional, The color collections
                  strokeWidth: 2,

                  /// Optional, The stroke of the line, only applicable to widget which contains line
                  // backgroundColor: Color.fromARGB(255, 182, 211, 18),

                  /// Optional, Background of the widget
                  // pathBackgroundColor: Color.fromARGB(255, 218, 12, 12)

                  /// Optional, the stroke backgroundColor
                ),
              ));
            }
          },
        ),
      ),
    );
  }
}
