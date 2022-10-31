import 'package:flutter/material.dart';

import '../../../models/model_news.dart';

class LinearGradinetAndTextCard extends StatelessWidget {
  const LinearGradinetAndTextCard({
    Key? key,
    required this.data,
    required this.index,
  }) : super(key: key);

  final ListModelNews data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(
            end: Alignment.topCenter,
            begin: Alignment.bottomCenter,
            colors: [Colors.black, Colors.transparent]),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          "${data.articles![index].title}",
          style: const TextStyle(
            fontFamily: 'Cairo',
          ),
          textAlign: TextAlign.end,
        ),
      ),
    );
  }
}
