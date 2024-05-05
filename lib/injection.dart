import 'package:get/get.dart';
import 'package:youtube_clone/controllers/mini_player_controller.dart';
import 'package:youtube_clone/controllers/selected_video_controller.dart';

Future<void> init() async {
  //controllers
  Get.lazyPut(() => SelectedVideoController());
  Get.lazyPut(() => MiniplayerController());
}
