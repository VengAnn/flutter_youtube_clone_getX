import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniplayer/miniplayer.dart';
import 'package:youtube_clone/components/iconbtn_bottom_nav_bar.dart';
import 'package:youtube_clone/controllers/selected_video_controller.dart';
import 'package:youtube_clone/data/data.dart';
import 'package:youtube_clone/utils/constant_color.dart';
import 'package:youtube_clone/utils/dimension.dart';
import 'package:youtube_clone/views/pages/home_page.dart';
import 'package:youtube_clone/views/pages/video_detail_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    // home page
    const HomePage(),
    Container(
      color: Colors.blue,
      width: Dimensions.screenWidth,
      child: const Text("screen3"),
    ),
    Container(
      color: Colors.orangeAccent,
      width: Dimensions.screenWidth,
      child: const Text("screen4"),
    ),
    Container(
      color: Colors.deepOrange,
      width: Dimensions.screenWidth,
      child: const Text("screen5"),
    ),
    Container(
      color: Colors.deepPurple,
      width: Dimensions.screenWidth,
      child: const Text("screen6"),
    ),
  ];

  void _itemSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SelectedVideoController>(
          builder: (selectedVideoController) {
        return SafeArea(
          child: Stack(
            children: _screens
                .asMap()
                .map(
                  (i, screen) => MapEntry(
                    i,
                    Offstage(
                      offstage: _selectedIndex != i,
                      child: screen,
                    ),
                  ),
                )
                .values
                .toList()
              ..add(
                Offstage(
                  // this special place code miniplayer
                  // selectedVideoController.selectedVideo  == null it not show mini player !=null it'll show
                  offstage: selectedVideoController.selectedVideo == null,
                  child: Miniplayer(
                    minHeight: Dimensions.height20 * 3,
                    maxHeight: MediaQuery.of(context).size.height,
                    builder: (height, percentage) {
                      log("value :${selectedVideoController.selectedVideo}");
                      if (selectedVideoController.selectedVideo == null) {
                        return const SizedBox();
                      } else {
                        // otherwise !null show whateve i want this

                        //check if height is > min height + 50 show Video Detail screen
                        if (height > Dimensions.height20 * 3) {
                          return const VideoDetailPage();
                        }
                        // otherwise show if height is < Dimensions.height20 * 3 show minim player
                        return Container(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: Dimensions.width20 * 6,
                                    height: Dimensions.height20 * 2.7,
                                    color: Colors.amber,
                                  ),
                                  //
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: Dimensions.width5,
                                      ),
                                      child: const Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.justify,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                          ),
                                          // text name channel
                                          Text(
                                            "MusicKh",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: ConstantColor.colorgrey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  //icon play
                                  IconButton(
                                    icon: Icon(
                                      Icons.play_arrow,
                                      color: ConstantColor.colorWhite,
                                      size: Dimensions.width20,
                                    ),
                                    onPressed: () {},
                                  ),
                                  //icon close
                                  IconButton(
                                    icon: Icon(
                                      Icons.close,
                                      color: ConstantColor.colorWhite,
                                      size: Dimensions.width20,
                                    ),
                                    onPressed: () {
                                      selectedVideoController
                                          .setSelectedVideo(null);
                                    },
                                  ),
                                ],
                              ),
                              const LinearProgressIndicator(
                                value: 0.4,
                                valueColor: AlwaysStoppedAnimation(
                                  Colors.red,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
          ),
        );
      }),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.zero,
            color: Theme.of(context).scaffoldBackgroundColor,
            width: Dimensions.screenWidth,
            height: Dimensions.height20 * 3.2,
            child: Stack(
              // mainAxisSize: MainAxisSize.min,
              children: [
                // draw divider horizontal
                Positioned.fill(
                  top: -Dimensions.height20 * 3.2,
                  child: const Divider(
                    thickness: 1,
                    color: Colors.black,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // all IconButton Bottom Navigation Bar
                    IconButtonBottonNavBar(
                      onTap: () => _itemSelected(0),
                      icon: Icons.home,
                      text: "Home",
                      colorText: ConstantColor.colorWhite,
                      typeBottomNavBar: TypeBottomNavBar.normal,
                    ),
                    IconButtonBottonNavBar(
                      onTap: () => _itemSelected(1),
                      icon: Icons.shortcut_outlined,
                      text: "Short",
                      colorText: ConstantColor.colorWhite,
                      typeBottomNavBar: TypeBottomNavBar.normal,
                    ),
                    // button add
                    SizedBox(
                      height: Dimensions.height20 * 2.7,
                      child: Stack(
                        children: [
                          IconButtonBottonNavBar(
                            onTap: () => _itemSelected(2),
                            radius: Dimensions.radius20,
                            icon: Icons.add_outlined,
                            colorText: ConstantColor.colorWhite,
                            colorBorder: ConstantColor.colorWhite,
                            typeBottomNavBar: TypeBottomNavBar.normalCircle,
                          ),
                        ],
                      ),
                    ),
                    IconButtonBottonNavBar(
                      onTap: () => _itemSelected(3),
                      icon: Icons.subscriptions_outlined,
                      text: "Subscriptoins",
                      colorText: ConstantColor.colorWhite,
                      typeBottomNavBar: TypeBottomNavBar.normal,
                    ),
                    IconButtonBottonNavBar(
                      onTap: () => _itemSelected(4),
                      icon: Icons.person,
                      text: "You",
                      colorText: ConstantColor.colorWhite,
                      typeBottomNavBar: TypeBottomNavBar.circleAvatar,
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
