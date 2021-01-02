import 'package:epic_seven_tools/di/get_it.dart';
import 'package:epic_seven_tools/domain/entities/filter_entity.dart';
import 'package:epic_seven_tools/presentation/blocs/hero_list/hero_list_cubit.dart';
import 'package:epic_seven_tools/presentation/widgets/button.dart';
import 'package:flutter/material.dart';

class CheckboxBottomSheetWidget extends StatefulWidget {
  const CheckboxBottomSheetWidget({
    Key key,
  }) : super(key: key);

  @override
  _CheckboxBottomSheetWidgetState createState() =>
      _CheckboxBottomSheetWidgetState();
}

class _CheckboxBottomSheetWidgetState extends State<CheckboxBottomSheetWidget> {
  FilterEntity filter = FilterEntity(attributteFilters: {
    "fire": false,
    "ice": false,
    "wind": false,
    "light": false,
    "dark": false,
  }, roleFilters: {
    "knight": false,
    "assassin": false,
    "mage": false,
    "marauder": false,
    "ranger": false,
    "warrior": false,
  }, starFilters: {
    5: false,
    4: false,
    3: false,
  });

  @override
  Widget build(BuildContext context) {
    final HeroListCubit cubit = getItInstance<HeroListCubit>();
    return Container(
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      CheckboxListTile(
                        secondary: Image.asset(
                            'assets/cheatsheet/cm_icon_profire.png'),
                        value: filter.attributteFilters["fire"],
                        onChanged: (value) {
                          setState(() {
                            filter.attributteFilters["fire"] = value;
                          });
                        },
                      ),
                      CheckboxListTile(
                        value: filter.attributteFilters["ice"],
                        onChanged: (value) {
                          setState(() {
                            filter.attributteFilters["ice"] = value;
                          });
                        },
                        secondary:
                            Image.asset('assets/cheatsheet/cm_icon_proice.png'),
                      ),
                      CheckboxListTile(
                        value: filter.attributteFilters["wind"],
                        onChanged: (value) {
                          setState(() {
                            filter.attributteFilters["wind"] = value;
                          });
                        },
                        secondary: Image.asset(
                            'assets/cheatsheet/cm_icon_prowind.png'),
                      ),
                      CheckboxListTile(
                        value: filter.attributteFilters["light"],
                        onChanged: (value) {
                          setState(() {
                            filter.attributteFilters["light"] = value;
                          });
                        },
                        secondary: Image.asset(
                            'assets/cheatsheet/cm_icon_prolight.png'),
                      ),
                      CheckboxListTile(
                        value: filter.attributteFilters["dark"],
                        onChanged: (value) {
                          setState(() {
                            filter.attributteFilters["dark"] = value;
                          });
                        },
                        secondary: Image.asset(
                            'assets/cheatsheet/cm_icon_prodark.png'),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      CheckboxListTile(
                        value: filter.roleFilters["knight"],
                        onChanged: (value) {
                          setState(() {
                            filter.roleFilters["knight"] = value;
                          });
                        },
                        secondary: Image.asset(
                          'assets/cheatsheet/cm_icon_role_knight.png',
                          scale: 1.5,
                        ),
                      ),
                      CheckboxListTile(
                        value: filter.roleFilters["assassin"],
                        onChanged: (value) {
                          setState(() {
                            filter.roleFilters["assassin"] = value;
                          });
                        },
                        secondary: Image.asset(
                          'assets/cheatsheet/cm_icon_role_assassin.png',
                          scale: 1.5,
                        ),
                      ),
                      CheckboxListTile(
                        value: filter.roleFilters["mage"],
                        onChanged: (value) {
                          setState(() {
                            filter.roleFilters["mage"] = value;
                          });
                        },
                        secondary: Image.asset(
                          'assets/cheatsheet/cm_icon_role_mage.png',
                          scale: 1.5,
                        ),
                      ),
                      CheckboxListTile(
                        value: filter.roleFilters["marauder"],
                        onChanged: (value) {
                          setState(() {
                            filter.roleFilters["marauder"] = value;
                          });
                        },
                        secondary: Image.asset(
                          'assets/cheatsheet/cm_icon_role_manauser.png',
                          scale: 1.5,
                        ),
                      ),
                      CheckboxListTile(
                        value: filter.roleFilters["ranger"],
                        onChanged: (value) {
                          setState(() {
                            filter.roleFilters["ranger"] = value;
                          });
                        },
                        secondary: Image.asset(
                          'assets/cheatsheet/cm_icon_role_ranger.png',
                          scale: 1.5,
                        ),
                      ),
                      CheckboxListTile(
                        value: filter.roleFilters["warrior"],
                        onChanged: (value) {
                          setState(() {
                            filter.roleFilters["warrior"] = value;
                          });
                        },
                        secondary: Image.asset(
                          'assets/cheatsheet/cm_icon_role_warrior.png',
                          scale: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      CheckboxListTile(
                        value: filter.starFilters[5],
                        onChanged: (value) {
                          setState(() {
                            filter.starFilters[5] = value;
                          });
                        },
                        title: Text("5 ⭐️"),
                      ),
                      CheckboxListTile(
                        value: filter.starFilters[4],
                        onChanged: (value) {
                          setState(() {
                            filter.starFilters[4] = value;
                          });
                        },
                        title: Text("4 ⭐️"),
                      ),
                      CheckboxListTile(
                        value: filter.starFilters[3],
                        onChanged: (value) {
                          setState(() {
                            filter.starFilters[3] = value;
                          });
                        },
                        title: Text("3 ⭐️"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Button(
                text: "Ok",
                onButtonPressed: () {
                  cubit.getFilteredList(
                    filter,
                  );
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
    );
  }
}
