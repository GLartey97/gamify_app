// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:gamify_app/data.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var deviceHeight;
  var deviceWidth;
  var selectedGame;

  @override
  void initState() {
    super.initState();
    selectedGame = 0;
  }

  @override
  Widget build(BuildContext context) {
    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          //Featured Games Background
          SizedBox(
            height: deviceHeight * 0.50,
            width: deviceWidth,
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  selectedGame = index;
                });
              },
              scrollDirection: Axis.horizontal,
              children: featuredGames.map((game) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(game.coverImage.url),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),

          //Gradient Box (background)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: deviceHeight * 0.80,
              width: deviceWidth,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(35, 45, 59, 1.0),
                    Colors.transparent,
                  ],
                  stops: [0.65, 1.0],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),

          //TopLayer
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: deviceWidth * 0.05,
              vertical: deviceHeight * 0.005,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: deviceHeight * 0.13,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //1st Icon
                      const Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30,
                      ),
                      Row(
                        children: [
                          //2nd Icon
                          const Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 30,
                          ),
                          //Spacing
                          SizedBox(
                            width: deviceWidth * 0.03,
                          ),
                          //3rd Icon
                          const Icon(
                            Icons.notifications_none,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: deviceHeight * 0.13,
                  width: deviceWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        featuredGames[selectedGame].title,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: deviceHeight * 0.040,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: featuredGames.map((game) {
                          double circleRadius = deviceHeight * 0.004;
                          return Container(
                            height: circleRadius * 2,
                            width: circleRadius * 2,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
