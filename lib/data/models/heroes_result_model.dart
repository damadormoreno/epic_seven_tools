import 'package:epic_seven_tools/data/models/hero_model.dart';

class HeroesResultModel {
  List<HeroModel> heroes;

  HeroesResultModel({this.heroes});

  HeroesResultModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      heroes = new List<HeroModel>();
      json['results'].forEach((v) {
        heroes.add(HeroModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.heroes != null) {
      data['results'] = this.heroes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
