import 'package:flutter/material.dart';
import 'package:gamify_app/data.dart';

class ScrollableGamesWidget extends StatelessWidget {
  const ScrollableGamesWidget(
      this.height, this.weight, this.isShowTitle, this.gameData,
      {super.key});

  final double height;
  final double weight;
  final bool isShowTitle;
  final List<Game> gameData;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
