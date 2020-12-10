import 'package:epic_seven_tools/data/models/hero_model.dart';
import 'package:equatable/equatable.dart';

class HeroEntity extends Equatable {
  final String sId;
  final String id;
  final String name;
  final bool moonlight;
  final int rarity;
  final String attribute;
  final String role;
  final Assets assets;

  HeroEntity({
    this.sId,
    this.id,
    this.name,
    this.moonlight,
    this.rarity,
    this.attribute,
    this.role,
    this.assets,
  }) : assert(id != null, 'id must no be null');

  @override
  List<Object> get props => [sId, id];

  @override
  bool get stringify => true;
}
