import 'dart:io';

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:chatview/chatview.dart';
import 'package:chatview/src/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget(
      {super.key,
      required this.message,
      required this.isMessageBySender,
      this.videoMessageConfiguration,
      required this.customVideoPlayerSettings});

  final Message message;
  final bool isMessageBySender;
  final VideoMessageConfiguration? videoMessageConfiguration;
  final CustomVideoPlayerSettings customVideoPlayerSettings;
  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late CachedVideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

  @override
  void initState() {
    String urlOrPath = widget.message.message;

    bool isUrl = urlOrPath.isUrl;

    super.initState();
    if (isUrl) {
      videoPlayerController = CachedVideoPlayerController.network(urlOrPath)
        ..initialize().then((value) => setState(() {}));
      _customVideoPlayerController = CustomVideoPlayerController(
          context: context,
          videoPlayerController: videoPlayerController,
          customVideoPlayerSettings: widget.customVideoPlayerSettings);
    } else {
      videoPlayerController = CachedVideoPlayerController.file(File(urlOrPath))
        ..initialize().then((value) => setState(() {}));
      _customVideoPlayerController = CustomVideoPlayerController(
        context: context,
        videoPlayerController: videoPlayerController,
        customVideoPlayerSettings: widget.customVideoPlayerSettings,
      );
    }
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: widget.isMessageBySender
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        SizedBox(
          height: widget.videoMessageConfiguration?.height ?? 200,
          width: widget.videoMessageConfiguration?.width ?? 250,
          child: CustomVideoPlayer(
            customVideoPlayerController: _customVideoPlayerController,
          ),
        ),
      ],
    );
  }
}
