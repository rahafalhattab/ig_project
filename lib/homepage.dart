import 'package:flutter/material.dart';
import 'package:ig_project/constant.dart';

import 'chat.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/text3logo.png",
                        width: 100, height: 100),
                    IconButton(
                        icon: Icon(Icons.message),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Chat()));
                        }),
                  ],
                ),
              ),
              //here we start with the stories section:
              ///////////////////////////////////////////////////////////
              Container(
                height: 150,
                width: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          //color: Colors.red,
                          height: 50,
                          width: 50,
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://image.pngaaa.com/577/589577-middle.png"),
                            radius: 20,
                          ),
                        ),
                        Text(
                          "name",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    );
                  },
                ),
              ),
              //////////////////////the post ///////////////////////
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://image.pngaaa.com/577/589577-middle.png"),
                                  radius: 20,
                                ),
                                Text(
                                  "User name",
                                  style: TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                            Icon((Icons.more_horiz_outlined),
                                color: Colors.black),
                          ],
                        ),
                        Image.asset("assets/cat_PNG106.png"),
                        /////////////////////the icons bellow the post /////////
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon((Icons.favorite_border),
                                    color: Colors.black),
                                Icon((Icons.comment), color: Colors.black),
                                Icon((Icons.send), color: Colors.black),
                              ],
                            ),
                            Icon((Icons.bookmark_add_rounded),
                                color: Colors.black),
                          ],
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                label: "search",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.video_collection_outlined,
                  color: Colors.black,
                ),
                label: "reels",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.black,
                ),
                label: "fav",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                label: "profile",
              ),
            ],
          )),
    );
  }
}
