import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:glass_kit/glass_kit.dart';

import 'package:viva_sport/controllers/match_controller.dart';
import 'package:viva_sport/costansts/color.dart';
import 'package:viva_sport/costansts/matches_api.dart';
import 'package:viva_sport/db/token.dart';
import 'package:viva_sport/services/api_matches.dart';
import 'package:viva_sport/views/pages/news.dart';
import 'package:viva_sport/views/pages/person.dart';
import 'package:viva_sport/views/pages/scoreboard.dart';

import '../../models/matches/matches_model.dart';
import '../widgets/sport/match/category_button.dart';

class MatchesScreen extends GetView<MatchController> {
  MatchesScreen({Key? key}) : super(key: key);

  final String fromTime = DateFormat('yyyy-MM-d').format(DateTime.now());
  final String toTime = DateFormat('yyyy-MM-d').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        title: const Text("VIVA SPORT"),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: GetBuilder<MatchController>(
        init: MatchController(),
        builder: (_) {
          return apiToken == "${storage.read("token")}"
              ? IndexedStack(
                  index: controller.indexed,
                  children: [
                    Column(
                      children: [
                        //Butten//////////////////
                        SizedBox(
                          height: 80,
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: listNameLeague.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                ///////////////////////////////////
                                onTap: (() {
                                  controller.changeStats(index);
                                }),
                                child: CategoriesButton(
                                  img: listImgLeague[index].toString(),
                                  text: listNameLeague[index].toString(),
                                  index: index,
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          // height: screenHeight,

                          padding:
                              const EdgeInsets.only(top: 12.0, bottom: 6.0),
                          child: ElevatedButton(
                              onPressed: () {
                                controller.changeDataTimeInCremet(context);
                              },
                              child: Text(controller.time)),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            height: screenHeight,
                            width: screenWidth,
                            // padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            // margin: const EdgeInsets.only(top: 30),
                            child: StreamBuilder(
                              stream: MatchesApi()
                                  .getMatch(

                                      ///////////////////////////////////////////////////////
                                      ////////////////////////////////////////////////
                                      dateFrom: controller.time,
                                      dateTo: controller.time,
                                      code: listCodeLeague[controller.currnt])
                                  .asStream(),
                              builder: (context, AsyncSnapshot snapshot) {
                                late MatchModel data = snapshot.data;

                                if (snapshot.hasData) {
                                  return data.matches!.isNotEmpty
                                      ? ListView.builder(
                                          itemCount: data.matches!.length,
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 15, left: 12, right: 12),
                                              child: Container(
                                                  margin: const EdgeInsets.only(
                                                      bottom: 12),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 12),
                                                  width: screenWidth * 0.8,
                                                  height: screenHeight * 0.30,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            35.0),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color:
                                                            kPrimaryLabelColor,
                                                        offset: Offset(0, 4),
                                                        blurRadius: 16.0,
                                                      ),
                                                    ],
                                                    // color:
                                                    //     kCardPopupBackgroundColor,
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "${data.matches![index].competition!.name}"
                                                        ' '
                                                        "${data.matches![index].matchday!}",
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: const TextStyle(
                                                            color:
                                                                kCourseElementIconColor,
                                                            fontSize: 22),
                                                      ),
                                                      const SizedBox(
                                                        height: 12,
                                                      ),

                                                      //////////////////// الوقت///////////////////////
                                                      Container(
                                                          child: data
                                                                      .matches![
                                                                          index]
                                                                      .status !=
                                                                  'IN_PLAY'
                                                              ? data
                                                                          .matches![
                                                                              index]
                                                                          .status !=
                                                                      'FINISHED'
                                                                  ? Text(
                                                                      DateFormat(
                                                                              'h:mm a')
                                                                          .format(
                                                                              DateTime.parse("${DateTime.parse("${data.matches![index].utcDate}").toLocal()}")),
                                                                      style: const TextStyle(
                                                                          color:
                                                                              kPrimaryLabelColor,
                                                                          fontSize:
                                                                              18),
                                                                    )
                                                                  : const Text(
                                                                      "انتهت",
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              'Cairo',
                                                                          color:
                                                                              Colors.black),
                                                                    )
                                                              : LottieBuilder
                                                                  .network(
                                                                  'https://assets4.lottiefiles.com/packages/lf20_uenrvn87.json',
                                                                  height: 30,
                                                                )),

                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Column(
                                                            children: [
                                                              SizedBox(
                                                                height: 80,
                                                                width: 80,
                                                                child: data
                                                                            .matches![
                                                                                index]
                                                                            .homeTeam!
                                                                            .crest !=
                                                                        null
                                                                    ? data
                                                                            .matches![
                                                                                index]
                                                                            .homeTeam!
                                                                            .crest!
                                                                            .contains(
                                                                                'svg')
                                                                        ? SizedBox(
                                                                            width:
                                                                                50,
                                                                            height:
                                                                                50,
                                                                            child: SvgPicture.network(
                                                                                height: 50,
                                                                                width: 50,
                                                                                "${data.matches![index].homeTeam!.crest}"),
                                                                          )
                                                                        : Image.network(
                                                                            "${data.matches![index].homeTeam!.crest}")
                                                                    : Image.asset(
                                                                        "assets/images/eroor.jpg"),
                                                              ),
                                                              const SizedBox(
                                                                height: 8,
                                                              ),
                                                              Text(
                                                                "${data.matches![index].homeTeam!.shortName}",
                                                                style: const TextStyle(
                                                                    overflow:
                                                                        TextOverflow
                                                                            .clip,
                                                                    color:
                                                                        kCourseElementIconColor,
                                                                    fontSize:
                                                                        10),
                                                              ),
                                                            ],
                                                          ),
                                                          Container(
                                                            alignment: Alignment
                                                                .center,
                                                            height: 50,
                                                            width: 100,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .blueAccent,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            35.0),
                                                                boxShadow: const [
                                                                  BoxShadow(
                                                                    color:
                                                                        kPrimaryLabelColor,
                                                                    offset:
                                                                        Offset(
                                                                            0,
                                                                            4),
                                                                    blurRadius:
                                                                        10.0,
                                                                  ),
                                                                ]),
                                                            child: data
                                                                        .matches![
                                                                            index]
                                                                        .score!
                                                                        .fullTime!
                                                                        .away !=
                                                                    null
                                                                ? Text(
                                                                    "${data.matches![index].score!.fullTime!.home} "
                                                                    "  -  "
                                                                    "${data.matches![index].score!.fullTime!.away} ",
                                                                    style: const TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            22),
                                                                  )
                                                                : const Text(
                                                                    "المباراة لم تبدأ",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'Cairo',
                                                                        fontSize:
                                                                            12),
                                                                  ),
                                                          ),
                                                          Column(
                                                            children: [
                                                              SizedBox(
                                                                height: 80,
                                                                width: 80,
                                                                child: data
                                                                            .matches![
                                                                                index]
                                                                            .awayTeam!
                                                                            .crest !=
                                                                        null
                                                                    ? data
                                                                            .matches![
                                                                                index]
                                                                            .awayTeam!
                                                                            .crest!
                                                                            .contains(
                                                                                'svg')
                                                                        ? Container(
                                                                            width:
                                                                                50,
                                                                            height:
                                                                                50,
                                                                            child:
                                                                                SvgPicture.network(
                                                                              "${data.matches![index].awayTeam!.crest}",
                                                                              width: 50,
                                                                              height: 50,
                                                                            ),
                                                                          )
                                                                        : Image.network(
                                                                            "${data.matches![index].awayTeam!.crest}")
                                                                    : Image.asset(
                                                                        "assets/images/eroor.jpg"),
                                                              ),
                                                              const SizedBox(
                                                                height: 8,
                                                              ),
                                                              Text(
                                                                "${data.matches![index].awayTeam!.shortName}",
                                                                style: const TextStyle(
                                                                    overflow:
                                                                        TextOverflow
                                                                            .clip,
                                                                    color:
                                                                        kCourseElementIconColor,
                                                                    fontSize:
                                                                        10),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  )),
                                            );
                                          },
                                        )
                                      : Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              const Text(
                                                'لا تو جد مباريات اليوم',
                                                style: TextStyle(
                                                    shadows: [
                                                      Shadow(
                                                          color: Colors.black,
                                                          blurRadius: 12.0)
                                                    ],
                                                    fontSize: 23,
                                                    fontFamily: 'Cairo',
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255)),
                                              ),
                                              const SizedBox(
                                                height: 79,
                                              ),
                                              SizedBox(
                                                  width: 250,
                                                  height: 250,
                                                  child: Image.asset(
                                                      "assets/images/glass.png")),
                                            ],
                                          ),
                                        );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    ScorBoard(),
                    NewsPage(),
                    Person(),
                  ],
                )
              : Person();
        },
      ),
      bottomNavigationBar:
          bottomNavigBar(controller: controller, con: controller),
    );
  }
}

class bottomNavigBar extends StatelessWidget {
  const bottomNavigBar({
    Key? key,
    required this.controller,
    required this.con,
  }) : super(key: key);

  final MatchController controller;
  final MatchController con;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MatchController>(
      init: MatchController(),
      builder: (_) {
        return FlashyTabBar(
            selectedIndex: controller.indexed,
            height: 55,
            showElevation: true,
            animationDuration: const Duration(milliseconds: 1000),
            onItemSelected: (index) =>
                controller.changeBottomNavigationBar(index),
            items: [
              FlashyTabBarItem(
                activeColor: Colors.white,
                icon: const Icon(CupertinoIcons.sportscourt),
                title: const Text('Events'),
              ),
              FlashyTabBarItem(
                activeColor: Colors.white,
                icon: const Icon(CupertinoIcons.line_horizontal_3_decrease),
                title: const Text('League'),
              ),
              FlashyTabBarItem(
                activeColor: Colors.white,
                icon: const Icon(CupertinoIcons.news),
                title: const Text('News'),
              ),
              FlashyTabBarItem(
                activeColor: Colors.white,
                icon: const Icon(CupertinoIcons.settings_solid),
                title: const Text('Settings'),
              ),
            ]);
      },
    );
  }
}
