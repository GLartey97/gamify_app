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
      height: height * 1.04,
      width: width,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: gameData.map((game) {
          return Container(
            height: height,
            width: width * 0.30,
            padding: EdgeInsets.only(right: width * 0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: height * 0.80,
                  width: width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(game.coverImage.url),
                    ),
                  ),
                ),
                isShowTitle
                    ? Text(
                        game.title,
                        maxLines: 2,
                        style: TextStyle(
                            color: Colors.white, fontSize: height * 0.08),
                      )
                    : Container(),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
