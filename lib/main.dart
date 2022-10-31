import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:viva_sport/bindings/matches_binding.dart';
import 'package:viva_sport/views/pages/matches.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const VivaSport());
}

class VivaSport extends StatelessWidget {
  const VivaSport({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      theme: ThemeData(fontFamily: 'Cairo'),
      themeMode: ThemeMode.dark,
      title: 'VivaSport',
      initialBinding: MatchBinding(),
      getPages: [
        // GetPage(
        //   name: '/',
        //   page: () => NewsPage(),
        //   binding: NewsBinding(),
        // ),
        GetPage(
          name: '/',
          page: () => MatchesScreen(),
          binding: MatchBinding(),
        ),

        // GetPage(
        //   name: '/',
        //   page: () => ScorBoard(),
        //   binding: ScorBoardBinding(),
        // ),
      ],
    );
  }
}
