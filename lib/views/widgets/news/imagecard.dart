import 'package:flutter/material.dart';
import 'package:viva_sport/views/widgets/news/lineargradintandtext.dart';

import '../../../models/model_news.dart';

class ImageCard extends StatelessWidget {
  const ImageCard({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required this.data,
    required this.index,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;
  final ListModelNews data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return data.articles![index].urlToImage != null
        ? Container(
            height: screenHeight * 0.50,
            width: screenWidth * 0.90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                image: NetworkImage("${data.articles![index].urlToImage}"),
                fit: BoxFit.cover,
              ),
            ),
            child: LinearGradinetAndTextCard(data: data, index: index),
          )
        : Container(
            height: screenHeight * 0.50,
            width: screenWidth * 0.90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: const DecorationImage(
                image: AssetImage("assets/images/eroor.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: LinearGradinetAndTextCard(data: data, index: index),
          );
  }
}
