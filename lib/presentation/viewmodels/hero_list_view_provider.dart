import 'package:epic_seven_tools/di/get_it.dart';
import 'package:epic_seven_tools/domain/usecases/get_heroes.dart';
import 'package:epic_seven_tools/presentation/viewmodels/hero_list_notifier.dart';
import 'package:flutter_riverpod/all.dart';

final heroListNotifierProvider = StateNotifierProvider(
  (ref) => HeroListNotifier(getItInstance<GetHeroes>()),
);
