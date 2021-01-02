import 'package:epic_seven_tools/presentation/journeys/hero_detail/hero_detail_arguments.dart';
import 'package:flutter/material.dart';

class HeroDetailPage extends StatefulWidget {
  final HeroDetailArguments arguments;

  const HeroDetailPage({
    Key key,
    @required this.arguments,
  })  : assert(arguments != null, 'arguments not be null'),
        super(key: key);

  @override
  _HeroDetailPageState createState() => _HeroDetailPageState();
}

class _HeroDetailPageState extends State<HeroDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(widget.arguments.id),
      ),
    );
  }
}
