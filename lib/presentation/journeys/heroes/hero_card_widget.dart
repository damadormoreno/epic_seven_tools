import 'package:cached_network_image/cached_network_image.dart';
import 'package:epic_seven_tools/common/constants/size_constans.dart';
import 'package:epic_seven_tools/domain/entities/hero_entity.dart';
import 'package:epic_seven_tools/presentation/journeys/hero_detail/hero_detail_arguments.dart';
import 'package:epic_seven_tools/presentation/journeys/hero_detail/hero_detail_screen.dart';
import 'package:epic_seven_tools/presentation/themes/app_color.dart';
import 'package:flutter/material.dart';
import 'package:epic_seven_tools/common/extensions/size_extension.dart';
import 'package:epic_seven_tools/common/extensions/string_extensions.dart';

class HeroCardWidget extends StatelessWidget {
  final HeroEntity hero;
  const HeroCardWidget({
    Key key,
    @required this.hero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) =>
                HeroDetailPage(arguments: HeroDetailArguments(hero.id))));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        if (hero.attribute == 'light') AppColor.light,
                        if (hero.attribute == 'wind') AppColor.wind,
                        if (hero.attribute == 'dark') AppColor.dark,
                        if (hero.attribute == 'fire') AppColor.fire,
                        if (hero.attribute == 'ice') AppColor.ice,
                        if (hero.attribute == 'light') AppColor.light,
                        if (hero.attribute == 'none') AppColor.violet,
                      ],
                    ),
                    borderRadius:
                        BorderRadius.all(Radius.circular(Sizes.dimen_20.w))),
                child: CachedNetworkImage(
                  alignment: Alignment.center,
                  imageUrl: '${hero.assets.image}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Sizes.dimen_4.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  hero.name.toIntelliTrim(),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Row(
                  children: [
                    Text(
                      hero.rarity.toString(),
                      style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 18,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
