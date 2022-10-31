import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:viva_sport/controllers/match_controller.dart';
import 'package:viva_sport/services/api_scoreboard.dart';

import '../../costansts/matches_api.dart';
import '../../models/matches/scoreboard_model.dart';
import '../widgets/sport/match/category_button.dart';

class ScorBoard extends GetView<MatchController> {
  final List x = [0, 1, 2, 3, 4];

  ScorBoard({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GetBuilder<MatchController>(
            init: MatchController(),
            builder: (controller) => SizedBox(
              height: 80,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: x.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    ///////////////////////////////////
                    onTap: (() {
                      controller.changeStats(index);
                    }),
                    child: CategoriesButton(
                      //BUTON??????????????????
                      img: listImgLeague[index].toString(),
                      text: listNameLeague[index].toString(),
                      index: index,
                    ),
                  );
                },
              ),
            ),
          ),
          GetBuilder<MatchController>(
            init: MatchController(),
            builder: (controller) {
              return StreamBuilder(
                stream: ScorBoardServies()
                    .getScorBoard(listCodeLeague[controller.currnt])
                    .asStream(),
                builder: (context, AsyncSnapshot snapshot) {
                  ScorBoardModel? dateModel = snapshot.data;

                  return snapshot.data != null
                      ? Column(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 22.0),
                              child: TopRow(),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              // physics: const NeverScrollableScrollPhysics(),
                              itemCount: dateModel!.standings![0].table!.length,
                              itemBuilder: (context, index) {
                                return TableRow(
                                  index: index,
                                  data: dateModel,
                                  snapshot: snapshot,
                                );
                              },
                            ),
                          ],
                        )
                      : Center(
                          child: LottieBuilder.network(
                              'https://assets1.lottiefiles.com/packages/lf20_wypynepk.json'),
                        );
                },
              );
            },
          )
        ],
      ),
    );
  }
}

class TopRow extends StatelessWidget {
  const TopRow({super.key});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(fontSize: 11);

    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: 30,
          height: 30,
        ),
        const SizedBox(width: 20),
        Container(alignment: Alignment.center, child: const Text('Team')),
        const Spacer(),
        SizedBox(
          width: 28,
          child: Text('MP', style: textStyle),
        ),
        const SizedBox(
          width: 5,
        ),
        SizedBox(
          width: 28,
          child: Text('W', style: textStyle),
        ),
        const SizedBox(
          width: 5,
        ),
        SizedBox(
          width: 28,
          child: Text('D', style: textStyle),
        ),
        const SizedBox(
          width: 5,
        ),
        SizedBox(
          width: 28,
          child: Text('L', style: textStyle),
        ),
        const SizedBox(
          width: 5,
        ),
        SizedBox(
          width: 28,
          child: Text('G', style: textStyle),
        ),
        const SizedBox(
          width: 5,
        ),
        SizedBox(
          width: 28,
          child: Text('Pts', style: textStyle),
        ),
        const SizedBox(
          width: 5,
        ),
        Container(
          width: 5,
          height: 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey[600],
          ),
          padding: const EdgeInsets.fromLTRB(10, 5, 2, 5),
        ),
      ],
    );
  }
}

class TableRow extends StatelessWidget {
  final int index;
  final ScorBoardModel? data;
  final AsyncSnapshot snapshot;
  const TableRow({
    Key? key,
    required this.index,
    required this.data,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    TextStyle textStyle = const TextStyle(fontSize: 11, color: Colors.black54);

    return data!.competition!.code != "CL" && data!.competition!.code != "EC"
        ? Container(
            width: screenWidth,
            height: screenHeight * 0.030,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5),
              color: Colors.grey[300],
            ),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  color: index < 4
                      ? Colors.blue
                      : index == 4
                          ? const Color.fromARGB(255, 116, 238, 100)
                              .withOpacity(0.9)
                          : index > 16
                              ? Colors.red
                              : Colors.grey[700],
                  child: Text(
                    (index + 1).toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 4),
                Row(
                  children: [
                    SizedBox(
                        // margin: EdgeInsets.only(right: 18),
                        // padding: const EdgeInsets.only(right: 10),
                        height: 25,
                        width: 25,
                        child: data!.standings![0].table![index].team!.crest!
                                .contains('svg')
                            ? SizedBox(
                                height: 30,
                                width: 30,
                                child: SvgPicture.network(
                                    height: 30,
                                    width: 30,
                                    data!.standings![0].table![index].team!
                                        .crest!),
                              )
                            : Image.network(data!
                                .standings![0].table![index].team!.crest!)),
                    Text("${data!.standings![0].table![index].team!.shortName}",
                        style: textStyle),
                  ],
                ),
                const Spacer(),
                SizedBox(
                  width: 28,
                  child: Text(
                      "${data!.standings![0].table![index].playedGames!}",
                      style: textStyle),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 28,
                  child: Text("${data!.standings![0].table![index].won!}",
                      style: textStyle),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 28,
                  child: Text("${data!.standings![0].table![index].draw!}",
                      style: textStyle),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 28,
                  child: Text("${data!.standings![0].table![index].lost!}",
                      style: textStyle),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 28,
                  child: Text("${data!.standings![0].table![index].goalsFor!}",
                      style: textStyle),
                ),
                const SizedBox(
                  width: 5,
                ),
                SizedBox(
                  width: 28,
                  child: Text("${data!.standings![0].table![index].points!}",
                      style: textStyle),
                ),
                const SizedBox(
                  width: 5,
                ),
                Container(
                  width: 5,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[600],
                  ),
                  padding: const EdgeInsets.fromLTRB(10, 5, 2, 5),
                ),
              ],
            ),
          )
        : const Center();
  }
}
