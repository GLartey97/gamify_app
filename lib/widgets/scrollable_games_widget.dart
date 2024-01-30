import 'package:flutter/material.dart';
import 'package:gamify_app/data.dart';

class ScrollableGamesWidget extends StatelessWidget {
  const ScrollableGamesWidget(
      this.height, this.width, this.isShowTitle, this.gameData,
      {super.key});

  final double height;
  final double width;
  final bool isShowTitle;
  final List<Game> gameData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: gameData.map((game) {
          return SizedBox(
            height: height,
            width: width * 0.30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height * 0.80,
                  width: width * 0.45,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(game.coverImage.url),
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
