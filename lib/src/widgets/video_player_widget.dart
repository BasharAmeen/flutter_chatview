import 'dart:io';

import 'package:chatview/chatview.dart';
import 'package:chatview/src/extensions/extensions.dart';
import 'package:chatview/src/models/video_message_configuration.dart';
import 'package:flutter/material.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget(
      {super.key,
      required this.message,
      required this.isMessageBySender,
      this.videoMessageConfiguration});

  final Message message;
  final bool isMessageBySender;
  final VideoMessageConfiguration? videoMessageConfiguration;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  // late VideoPlayerController videoPlayerController;
  // late CustomVideoPlayerController _customVideoPlayerController;

  @override
  void initState() {
    String urlOrPath = widget.message.message;

    bool isUrl = urlOrPath.isUrl;

    super.initState();
    // if (isUrl) {
    //   videoPlayerController =
    //       VideoPlayerController.networkUrl(Uri.parse(urlOrPath))
    //         ..initialize().then((value) => setState(() {}));
    //   _customVideoPlayerController = CustomVideoPlayerController(
    //       context: context,
    //       videoPlayerController: videoPlayerController,
    //       customVideoPlayerSettings: const CustomVideoPlayerSettings());
    // } else {
    //   videoPlayerController = VideoPlayerController.file(File(urlOrPath))
    //     ..initialize().then((value) => setState(() {}));
    //   _customVideoPlayerController = CustomVideoPlayerController(
    //     context: context,
    //     videoPlayerController: videoPlayerController,
    //   );
    // }
  }

  @override
  void dispose() {
    // _customVideoPlayerController.dispose();
    // super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: widget.isMessageBySender
      // ? MainAxisAlignment.end
      // : MainAxisAlignment.start,
      children: [
        // SizedBox(
        //   height: widget.videoMessageConfiguration?.height ?? 200,
        //   width: widget.videoMessageConfiguration?.width ?? 250,
        //   child: CustomVideoPlayer(
        //     customVideoPlayerController: _customVideoPlayerController,
        //   ),
        // ),
      ],
    );
  }
}
