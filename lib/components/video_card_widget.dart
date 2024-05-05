import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_clone/components/button_icon_widget.dart';
import 'package:youtube_clone/controllers/selected_video_controller.dart';
import 'package:youtube_clone/data/data.dart';
import 'package:youtube_clone/utils/constant_color.dart';
import 'package:youtube_clone/utils/dimension.dart';
import 'package:youtube_clone/controllers/mini_player_controller.dart';

// ignore: must_be_immutable
class VideoCardWidget extends StatelessWidget {
  final VoidCallback? onTap;
  Video? video;

  VideoCardWidget({
    super.key,
    this.onTap,
    this.video,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SelectedVideoController>(
        builder: (selectedVideoController) {
      return GetBuilder<MiniplayerController>(builder: (miniplayerController) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width5),
          child: Column(
            children: [
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      log("vd ${selectedVideoController.selectedVideo}");
                      selectedVideoController.setSelectedVideo(video);
                      miniplayerController.animateToHeight(
                          state: PanelState.MAX);

                      if (onTap != null) onTap!();
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: Dimensions.height5 / 4),
                      width: double.infinity,
                      height: Dimensions.height20 * 11,
                      color: Colors.blue,
                    ),
                  ),
                  //time
                  Positioned(
                    right: Dimensions.width5,
                    bottom: Dimensions.width5,
                    child: const Text("7:34"),
                  ),
                ],
              ),
              SizedBox(height: Dimensions.height10),
              //
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //logo channel
                  GestureDetector(
                    onTap: () {
                      debugPrint("Navigation to profile");
                    },
                    child: CircleAvatar(
                      child: Image.asset(
                        width: Dimensions.width20 * 1.5,
                        height: Dimensions.width20 * 1.2,
                        fit: BoxFit.cover,
                        "assets/images/youtube.png",
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  //title
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.justify,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        // text name channel - view -time ago
                        Text(
                          "MusicKh • 2M views • 1 years ago",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: ConstantColor.colorgrey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // icon btn more_vert_outlined
                  ButtonIconWidget(
                    onTap: () {},
                    icon: Icons.more_vert_outlined,
                    padding: 0,
                  ),
                ],
              ),
            ],
          ),
        );
      });
    });
  }
}
