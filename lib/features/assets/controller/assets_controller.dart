import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AssetsController extends GetxController {
  late YoutubePlayerController youtubePlayerController;
  var isPlayerReady = false.obs;

  @override
  void onInit() {
    super.onInit();
    final videoId = YoutubePlayer.convertUrlToId('https://www.youtube.com/watch?v=jfKfPfyJRdk');

    youtubePlayerController = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    )..addListener(listener);
  }

  void listener() {
    if (isPlayerReady.value && !youtubePlayerController.value.isFullScreen) {
      // Custom behavior if needed
    }
  }

  void onPlayerReady() {
    isPlayerReady.value = true;
  }

  @override
  void onClose() {
    youtubePlayerController.dispose();
    super.onClose();
  }
}
