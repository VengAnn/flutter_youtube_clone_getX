import 'package:get/get.dart';
import 'package:youtube_clone/data/data.dart';

class SelectedVideoController extends GetxController {
  // ignore: prefer_typing_uninitialized_variables
  var selectedVideo;

  @override
  void onInit() {
    selectedVideo = null; // Initial value of selected video
    super.onInit();
  }

  void setSelectedVideo(Video? video) {
    selectedVideo = video;
    update(); // Notify GetX to update the UI
  }
}