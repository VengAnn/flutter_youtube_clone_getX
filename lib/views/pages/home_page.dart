import 'package:flutter/material.dart';
import 'package:youtube_clone/components/button_icon_widget.dart';
import 'package:youtube_clone/components/video_card_widget.dart';
import 'package:youtube_clone/data/data.dart';
import 'package:youtube_clone/utils/dimension.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _refresh() async {
    debugPrint("refreshed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: CustomScrollView(
          slivers: [
            // sliver appbar
            const SliverAppBar(
              floating: true,
              //toolbarHeight: Dimensions.height20 * 2,
              flexibleSpace: HeaderHome(),
            ),
            // this like the body of homepage
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final Video video = videos[index];
                  return VideoCardWidget(
                    video: video,
                  );
                },
                childCount:
                    videos.length, // Replace video.length with videos.length
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderHome extends StatelessWidget {
  const HeaderHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimensions.width5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // logo and text header
              Row(
                children: [
                  Image(
                    width: Dimensions.width20 * 1.8,
                    height: Dimensions.width20 * 1.2,
                    fit: BoxFit.cover,
                    image: const AssetImage("assets/images/youtube.png"),
                  ),
                  SizedBox(width: Dimensions.width5),
                  Text(
                    "Youtube".toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              //icon btn header
              ButtonIconWidget(
                onTap: () {},
                icon: Icons.search_outlined,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
