import 'package:viva_sport/db/token.dart';

enum Sports {
  competitions("/competitions"),
  teams("/teams"),
  persons("/persons"),
  matches("/matches"),
  standings("/standings");

  const Sports(this.value);
  final String value;
}

// var c = Get.find<PersonController>();
String apiToken = "${storage.read("token")}";

String baseUrlApiMatches = 'https://api.football-data.org/v4';

List listNameLeague = [
  'Premier League',
  'Bundesliga',
  'Serie A',
  'Primera Division',
  'Ligue 1',
  "European Championship",
  "UEFA Champions League",
];

List listImgLeague = [
  "https://crests.football-data.org/PL.png",
  "https://crests.football-data.org/BL1.png",
  "https://crests.football-data.org/SA.png",
  'https://crests.football-data.org/PD.png',
  "https://crests.football-data.org/FL1.png",
  "https://img2.arabpng.com/20180810/jwj/kisspng-2-1718-uefa-europa-league-europe-uefa-champions-sports-libro-5b6dc5b00aae28.2832227615339206880438.jpg",
  "https://crests.football-data.org/CL.png",
];

List<String> listCodeLeague = [
  "PL",
  "BL1",
  "SA",
  'PD',
  "FL1",
  "EC",
  "CL",
];
