import 'dart:io';

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:chatview/chatview.dart';
import 'package:chatview/src/extensions/extensions.dart';
import 'package:chatview/src/models/video_message_configuration.dart';
import 'package:flutter/material.dart';

class VideoPlayerWidget extends StatefulWidget {
  VideoPlayerWidget(
      {super.key,
      required this.message,
      required this.isMessageBySender,
      this.videoMessageConfiguration});

  final Message message;
  final bool isMessageBySender;
  final VideoMessageConfiguration? videoMessageConfiguration;
  late final VideoPlayerController videoPlayerController;
  late final CustomVideoPlayerController _customVideoPlayerController;

  @override
  State<VideoPlayerWidget> createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  @override
  void initState() {
    String urlOrPath = widget.message.message;

    bool isUrl = urlOrPath.isUrl;

    super.initState();
    if (isUrl) {
      widget.videoPlayerController =
          VideoPlayerController.networkUrl(Uri.parse(urlOrPath))
            ..initialize().then((value) => setState(() {}));
      widget._customVideoPlayerController = CustomVideoPlayerController(
          context: context,
          videoPlayerController: widget.videoPlayerController,
          customVideoPlayerSettings: CustomVideoPlayerSettings());
    } else {
      widget.videoPlayerController = VideoPlayerController.file(File(urlOrPath))
        ..initialize().then((value) => setState(() {}));
      widget._customVideoPlayerController = CustomVideoPlayerController(
        context: context,
        videoPlayerController: widget.videoPlayerController,
      );
    }
  }

  @override
  void dispose() {
    widget._customVideoPlayerController.dispose();
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
            customVideoPlayerController: widget._customVideoPlayerController,
          ),
        ),
      ],
    );
  }
}
