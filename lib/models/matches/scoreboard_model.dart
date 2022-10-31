class ScorBoardModel {
  Filters? filters;
  Area? area;
  Competition? competition;
  Season? season;
  List<Standings>? standings;

  ScorBoardModel(
      {this.filters, this.area, this.competition, this.season, this.standings});

  ScorBoardModel.fromJson(Map<String, dynamic> json) {
    filters =
        json['filters'] != null ? Filters.fromJson(json['filters']) : null;
    area = json['area'] != null ? Area.fromJson(json['area']) : null;
    competition = json['competition'] != null
        ? Competition.fromJson(json['competition'])
        : null;
    season = json['season'] != null ? Season.fromJson(json['season']) : null;
    if (json['standings'] != null) {
      standings = <Standings>[];
      json['standings'].forEach((v) {
        standings!.add(Standings.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (filters != null) {
      data['filters'] = filters!.toJson();
    }
    if (area != null) {
      data['area'] = area!.toJson();
    }
    if (competition != null) {
      data['competition'] = competition!.toJson();
    }
    if (season != null) {
      data['season'] = season!.toJson();
    }
    if (standings != null) {
      data['standings'] = standings!.map((v) => v.toJson()).toList();
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

class Standings {
  String? stage;
  String? type;
  Null? group;
  List<Table>? table;

  Standings({this.stage, this.type, this.group, this.table});

  Standings.fromJson(Map<String, dynamic> json) {
    stage = json['stage'];
    type = json['type'];
    group = json['group'];
    if (json['table'] != null) {
      table = <Table>[];
      json['table'].forEach((v) {
        table!.add(Table.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stage'] = stage;
    data['type'] = type;
    data['group'] = group;
    if (table != null) {
      data['table'] = table!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Table {
  int? position;
  Team? team;
  int? playedGames;
  String? form;
  int? won;
  int? draw;
  int? lost;
  int? points;
  int? goalsFor;
  int? goalsAgainst;
  int? goalDifference;

  Table(
      {this.position,
      this.team,
      this.playedGames,
      this.form,
      this.won,
      this.draw,
      this.lost,
      this.points,
      this.goalsFor,
      this.goalsAgainst,
      this.goalDifference});

  Table.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    team = json['team'] != null ? Team.fromJson(json['team']) : null;
    playedGames = json['playedGames'];
    form = json['form'];
    won = json['won'];
    draw = json['draw'];
    lost = json['lost'];
    points = json['points'];
    goalsFor = json['goalsFor'];
    goalsAgainst = json['goalsAgainst'];
    goalDifference = json['goalDifference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['position'] = position;
    if (team != null) {
      data['team'] = team!.toJson();
    }
    data['playedGames'] = playedGames;
    data['form'] = form;
    data['won'] = won;
    data['draw'] = draw;
    data['lost'] = lost;
    data['points'] = points;
    data['goalsFor'] = goalsFor;
    data['goalsAgainst'] = goalsAgainst;
    data['goalDifference'] = goalDifference;
    return data;
  }
}

class Team {
  int? id;
  String? name;
  String? shortName;
  String? tla;
  String? crest;

  Team({this.id, this.name, this.shortName, this.tla, this.crest});

  Team.fromJson(Map<String, dynamic> json) {
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
