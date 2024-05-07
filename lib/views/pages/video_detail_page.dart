import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:youtube_clone/components/video_card_widget.dart';
import 'package:youtube_clone/utils/dimension.dart';

class VideoDetailPage extends StatelessWidget {
  const VideoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // wrap GestureDetector to prevent click anywhere not to mini player
      onTap: () {},
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                //
                Stack(
                  children: [
                    Container(
                      height: Dimensions.height20 * 11,
                      width: Dimensions.screenWidth,
                      color: Colors.blue,
                    ),
                    Positioned(
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_drop_down_outlined),
                      ),
                    ),
                  ],
                ),
                //title of video detail
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.width10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                        textAlign: TextAlign.justify,
                      ),
                      // viewer and something
                      const Text(
                        "2M views • 1 years ago",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      //all icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ButtonIconDetail(
                            onTap: () {
                              log("like");
                            },
                            icon: Icons.thumb_up_alt_outlined,
                            text: "Like",
                          ),
                          ButtonIconDetail(
                            onTap: () {
                              log("unlike");
                            },
                            icon: Icons.thumb_down_outlined,
                            text: "UnLike",
                          ),
                          ButtonIconDetail(
                            onTap: () {
                              log("share");
                            },
                            icon: Icons.reply_outlined,
                            text: "Share",
                          ),
                          ButtonIconDetail(
                            onTap: () {},
                            icon: Icons.download_outlined,
                            text: "Download",
                          ),
                          ButtonIconDetail(
                            onTap: () {},
                            icon: Icons.library_add_outlined,
                            text: "Save",
                          ),
                        ],
                      ),
                      // Channel and subscribe
                      Padding(
                        padding: EdgeInsets.only(top: Dimensions.height10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: Dimensions.radius20,
                                ),
                                //
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: Dimensions.width10),
                                  child: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //name
                                      Text("MusicKH"),
                                      Text(
                                        "100K subscribers",
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            // subscribe
                            Text(
                              "Subscribe".toUpperCase(),
                              style: const TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonIconDetail extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String text;

  const ButtonIconDetail({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Icon(icon),
        ),
        Text(text),
      ],
    );
  }
}
