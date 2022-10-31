class MatchModel {
  Filters? filters;
  ResultSet? resultSet;
  Competition? competition;
  List<Matches>? matches;

  MatchModel({this.filters, this.resultSet, this.competition, this.matches});

  MatchModel.fromJson(Map<String, dynamic> json) {
    filters =
        json['filters'] != null ? Filters.fromJson(json['filters']) : null;
    resultSet = json['resultSet'] != null
        ? ResultSet.fromJson(json['resultSet'])
        : null;
    competition = json['competition'] != null
        ? Competition.fromJson(json['competition'])
        : null;
    if (json['matches'] != null) {
      matches = <Matches>[];
      json['matches'].forEach((v) {
        matches!.add(Matches.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (filters != null) {
      data['filters'] = filters!.toJson();
    }
    if (resultSet != null) {
      data['resultSet'] = resultSet!.toJson();
    }
    if (competition != null) {
      data['competition'] = competition!.toJson();
    }
    if (matches != null) {
      data['matches'] = matches!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Filters {
  String? season;

  Filters({this.season});

  Filters.fromJson(Map<String, dynamic> json) {
    season = json['season'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['season'] = season;
    return data;
  }
}

class ResultSet {
  int? count;
  String? first;
  String? last;
  int? played;

  ResultSet({this.count, this.first, this.last, this.played});

  ResultSet.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    first = json['first'];
    last = json['last'];
    played = json['played'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['first'] = first;
    data['last'] = last;
    data['played'] = played;
    return data;
  }
}

class Competition {
  int? id;
  String? name;
  String? code;
  String? type;
  String? emblem;

  Competition({this.id, this.name, this.code, this.type, this.emblem});

  Competition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    type = json['type'];
    emblem = json['emblem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['type'] = type;
    data['emblem'] = emblem;
    return data;
  }
}

class Matches {
  Area? area;
  Competition? competition;
  Season? season;
  int? id;
  String? utcDate;
  String? status;
  int? matchday;
  String? stage;
  Null? group;
  String? lastUpdated;
  HomeTeam? homeTeam;
  HomeTeam? awayTeam;
  Score? score;
  Odds? odds;
  List<Referees>? referees;

  Matches(
      {this.area,
      this.competition,
      this.season,
      this.id,
      this.utcDate,
      this.status,
      this.matchday,
      this.stage,
      this.group,
      this.lastUpdated,
      this.homeTeam,
      this.awayTeam,
      this.score,
      this.odds,
      this.referees});

  Matches.fromJson(Map<String, dynamic> json) {
    area = json['area'] != null ? Area.fromJson(json['area']) : null;
    competition = json['competition'] != null
        ? Competition.fromJson(json['competition'])
        : null;
    season = json['season'] != null ? Season.fromJson(json['season']) : null;
    id = json['id'];
    utcDate = json['utcDate'];
    status = json['status'];
    matchday = json['matchday'];
    stage = json['stage'];
    group = json['group'];
    lastUpdated = json['lastUpdated'];
    homeTeam =
        json['homeTeam'] != null ? HomeTeam.fromJson(json['homeTeam']) : null;
    awayTeam =
        json['awayTeam'] != null ? HomeTeam.fromJson(json['awayTeam']) : null;
    score = json['score'] != null ? Score.fromJson(json['score']) : null;
    odds = json['odds'] != null ? Odds.fromJson(json['odds']) : null;
    if (json['referees'] != null) {
      referees = <Referees>[];
      json['referees'].forEach((v) {
        referees!.add(Referees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (area != null) {
      data['area'] = area!.toJson();
    }
    if (competition != null) {
      data['competition'] = competition!.toJson();
    }
    if (season != null) {
      data['season'] = season!.toJson();
    }
    data['id'] = id;
    data['utcDate'] = utcDate;
    data['status'] = status;
    data['matchday'] = matchday;
    data['stage'] = stage;
    data['group'] = group;
    data['lastUpdated'] = lastUpdated;
    if (homeTeam != null) {
      data['homeTeam'] = homeTeam!.toJson();
    }
    if (awayTeam != null) {
      data['awayTeam'] = awayTeam!.toJson();
    }
    if (score != null) {
      data['score'] = score!.toJson();
    }
    if (odds != null) {
      data['odds'] = odds!.toJson();
    }
    if (referees != null) {
      data['referees'] = referees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Area {
  int? id;
  String? name;
  String? code;
  String? flag;

  Area({this.id, this.name, this.code, this.flag});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['code'] = code;
    data['flag'] = flag;
    return data;
  }
}

class Season {
  int? id;
  String? startDate;
  String? endDate;
  int? currentMatchday;
  Null? winner;

  Season(
      {this.id,
      this.startDate,
      this.endDate,
      this.currentMatchday,
      this.winner});

  Season.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    currentMatchday = json['currentMatchday'];
    winner = json['winner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['currentMatchday'] = currentMatchday;
    data['winner'] = winner;
    return data;
  }
}

class HomeTeam {
  int? id;
  String? name;
  String? shortName;
  String? tla;
  String? crest;

  HomeTeam({this.id, this.name, this.shortName, this.tla, this.crest});

  HomeTeam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    shortName = json['shortName'];
    tla = json['tla'];
    crest = json['crest'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['shortName'] = shortName;
    data['tla'] = tla;
    data['crest'] = crest;
    return data;
  }
}

class Score {
  String? winner;
  String? duration;
  FullTime? fullTime;
  FullTime? halfTime;

  Score({this.winner, this.duration, this.fullTime, this.halfTime});

  Score.fromJson(Map<String, dynamic> json) {
    winner = json['winner'];
    duration = json['duration'];
    fullTime =
        json['fullTime'] != null ? FullTime.fromJson(json['fullTime']) : null;
    halfTime =
        json['halfTime'] != null ? FullTime.fromJson(json['halfTime']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['winner'] = winner;
    data['duration'] = duration;
    if (fullTime != null) {
      data['fullTime'] = fullTime!.toJson();
    }
    if (halfTime != null) {
      data['halfTime'] = halfTime!.toJson();
    }
    return data;
  }
}

class FullTime {
  int? home;
  int? away;

  FullTime({this.home, this.away});

  FullTime.fromJson(Map<String, dynamic> json) {
    home = json['home'];
    away = json['away'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['home'] = home;
    data['away'] = away;
    return data;
  }
}

class Odds {
  double? homeWin;
  double? draw;
  double? awayWin;

  Odds({this.homeWin, this.draw, this.awayWin});

  Odds.fromJson(Map<String, dynamic> json) {
    homeWin = json['homeWin'];
    draw = json['draw'];
    awayWin = json['awayWin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['homeWin'] = homeWin;
    data['draw'] = draw;
    data['awayWin'] = awayWin;
    return data;
  }
}

class Referees {
  int? id;
  String? name;
  String? type;
  String? nationality;

  Referees({this.id, this.name, this.type, this.nationality});

  Referees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    nationality = json['nationality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['nationality'] = nationality;
    return data;
  }
}
