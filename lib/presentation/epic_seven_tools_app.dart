import 'package:epic_seven_tools/common/screen_util/screenutil.dart';
import 'package:epic_seven_tools/presentation/journeys/heroes/heroes_screen.dart';
import 'package:epic_seven_tools/presentation/journeys/home/home_screen.dart';
import 'package:epic_seven_tools/presentation/themes/app_color.dart';
import 'package:epic_seven_tools/presentation/themes/theme_text.dart';
import 'package:flutter/material.dart';

class EpicSevenToolsApp extends StatefulWidget {
  const EpicSevenToolsApp({Key key}) : super(key: key);

  @override
  _EpicSevenToolsAppState createState() => _EpicSevenToolsAppState();
}

class _EpicSevenToolsAppState extends State<EpicSevenToolsApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MaterialApp(
      navigatorKey: _navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Epic Seven Tools App',
      theme: ThemeData(
        unselectedWidgetColor: AppColor.royalBlue,
        primaryColor: Colors.grey[850],
        accentColor: AppColor.royalBlue,
        scaffoldBackgroundColor: Colors.grey[850],
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: ThemeText.getTextTheme(),
        appBarTheme: const AppBarTheme(elevation: 0),
      ),
      home: HomeScreen(),
    );
  }
}
