import 'package:epic_seven_tools/common/constants/size_constans.dart';
import 'package:epic_seven_tools/di/get_it.dart';
import 'package:epic_seven_tools/domain/entities/hero_entity.dart';
import 'package:epic_seven_tools/presentation/journeys/heroes/hero_card_widget.dart';
import 'package:epic_seven_tools/presentation/blocs/hero_list/hero_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:epic_seven_tools/common/extensions/size_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HeroesScreen extends StatefulWidget {
  const HeroesScreen({Key key}) : super(key: key);

  @override
  _HeroesScreenState createState() => _HeroesScreenState();
}

class _HeroesScreenState extends State<HeroesScreen>
    with AutomaticKeepAliveClientMixin {
  HeroListCubit heroListCubit;

  @override
  void initState() {
    super.initState();
    heroListCubit = getItInstance<HeroListCubit>();
    heroListCubit.getHeroList();
  }

  @override
  void dispose() {
    super.dispose();
    heroListCubit?.close();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (context) => heroListCubit,
      child: Scaffold(
        body: Container(
          child: BlocBuilder<HeroListCubit, HeroListState>(
            cubit: heroListCubit,
            builder: (context, state) {
              if (state is HeroListInitial || state is HeroListLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.blue,
                  ),
                );
              } else if (state is HeroListLoaded) {
                return SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.count(
                      mainAxisSpacing: Sizes.dimen_10.h,
                      crossAxisSpacing: Sizes.dimen_10.w,
                      crossAxisCount: 3,
                      children: state.heroes
                          .map(
                            (hero) => HeroCardWidget(
                              hero: hero,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
