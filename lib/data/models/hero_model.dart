import 'package:epic_seven_tools/domain/entities/hero_entity.dart';

class HeroModel extends HeroEntity {
  final String sId;
  final String id;
  final String name;
  final bool moonlight;
  final int rarity;
  final String attribute;
  final String role;
  final String zodiac;
  final SelfDevotion selfDevotion;
  final SelfDevotion devotion;
  final Assets assets;
  final List<dynamic> buffs;
  final List<dynamic> debuffs;
  final List<dynamic> common;

  HeroModel(
      {this.sId,
      this.id,
      this.name,
      this.moonlight,
      this.rarity,
      this.attribute,
      this.role,
      this.zodiac,
      this.selfDevotion,
      this.devotion,
      this.assets,
      this.buffs,
      this.debuffs,
      this.common})
      : super(
          sId: sId,
          id: id,
          name: name,
          moonlight: moonlight,
          rarity: rarity,
          attribute: attribute,
          role: role,
          assets: assets,
        );

  factory HeroModel.fromJson(Map<String, dynamic> json) {
    return HeroModel(
      sId: json['_id'],
      id: json['id'],
      name: json['name'],
      moonlight: json['moonlight'],
      rarity: json['rarity'],
      attribute: json['attribute'],
      role: json['role'],
      zodiac: json['zodiac'],
      selfDevotion: json['self_devotion'] != null
          ? new SelfDevotion.fromJson(json['self_devotion'])
          : null,
      devotion: json['devotion'] != null
          ? new SelfDevotion.fromJson(json['devotion'])
          : null,
      assets:
          json['assets'] != null ? new Assets.fromJson(json['assets']) : null,
      buffs: json['buffs'].cast<dynamic>(),
      debuffs: json['debuffs'].cast<dynamic>(),
      common: json['common'].cast<dynamic>(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['moonlight'] = this.moonlight;
    data['rarity'] = this.rarity;
    data['attribute'] = this.attribute;
    data['role'] = this.role;
    data['zodiac'] = this.zodiac;
    if (this.selfDevotion != null) {
      data['self_devotion'] = this.selfDevotion.toJson();
    }
    if (this.devotion != null) {
      data['devotion'] = this.devotion.toJson();
    }
    if (this.assets != null) {
      data['assets'] = this.assets.toJson();
    }
    data['buffs'] = this.buffs;
    data['debuffs'] = this.debuffs;
    data['common'] = this.common;
    return data;
  }
}

class SelfDevotion {
  String type;

  SelfDevotion({this.type});

  SelfDevotion.fromJson(Map<String, dynamic> json) {
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    return data;
  }
}

class Assets {
  String icon;
  String image;
  String thumbnail;

  Assets({this.icon, this.image, this.thumbnail});

  Assets.fromJson(Map<String, dynamic> json) {
    icon = json['icon'];
    image = json['image'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['icon'] = this.icon;
    data['image'] = this.image;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}
