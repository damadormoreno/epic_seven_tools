import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:epic_seven_tools/presentation/journeys/heroes/heroes_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('E7 Tools'),
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            HeroesScreen(),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        backgroundColor: Theme.of(context).primaryColor,
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Hero List'),
              icon: Icon(Icons.list),
              activeColor: Colors.white),
          BottomNavyBarItem(
              title: Text('Dmg Calc'),
              icon: Icon(Icons.calculate),
              activeColor: Colors.white),
          BottomNavyBarItem(
              title: Text('Leaks'),
              icon: Icon(Icons.info),
              activeColor: Colors.white),
          BottomNavyBarItem(
              title: Text('Maps'),
              icon: Icon(Icons.map),
              activeColor: Colors.white),
        ],
      ),
    );
  }
}
