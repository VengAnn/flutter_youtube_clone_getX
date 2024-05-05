import 'package:get/get.dart';
enum PanelState {
  MIN,
  MAX,
}

class MiniplayerController extends GetxController {
  var panelState = PanelState.MIN; // Set initial state to MIN

  void animateToHeight({required PanelState state}) {
    panelState = state;
    update(); // Notify GetX to update the UI
  }
}
