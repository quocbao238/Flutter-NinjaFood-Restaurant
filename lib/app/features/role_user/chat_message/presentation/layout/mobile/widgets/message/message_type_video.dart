import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ninja_theme/ninja_theme.dart';
import 'package:ninjafood/app/features/role_user/chat_message/controllers/room_chat_screen_controller.dart';
import 'package:ninjafood/app/models/message_chat_model.dart';
import 'package:video_player/video_player.dart';

import 'message_type_text.dart';

class ChatMessageVideo extends StatefulWidget {
  final MessageChatFile messageChat;
  final String timestamp;

  const ChatMessageVideo({Key? key, required this.messageChat, required this.timestamp}) : super(key: key);

  @override
  State<ChatMessageVideo> createState() => _ChatMessageVideoState();
}

class _ChatMessageVideoState extends State<ChatMessageVideo> with AutomaticKeepAliveClientMixin {
  late VideoPlayerController _controller;
  bool isPlaying = false;
  bool isPauseButtonVisible = false;
  Timer? _pauseButtonTimer;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _asyncInit();
  }

  void _asyncInit() async {
    _controller = VideoPlayerController.network(widget.messageChat.lstFiles.first.fileUrl)
      ..initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });

    _controller.addListener(() {
      if (!mounted) return;
      if (_controller.value.isInitialized && _controller.value.isPlaying) {
        if (!mounted) return;
        setState(() {
          isPlaying = true;
          isPauseButtonVisible = true;
        });
        _pauseButtonTimer = Timer(Duration(seconds: 1), () {
          if (!mounted) return;
          setState(() {
            isPauseButtonVisible = false;
          });
        });
      }
      if (_controller.value.isInitialized && !_controller.value.isPlaying) {
        if (!mounted) return;
        setState(() {
          isPlaying = false;
          isPauseButtonVisible = false;
        });
        _pauseButtonTimer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    if (_controller.value.isInitialized) _controller.dispose();
    _pauseButtonTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final messageScreenController = Get.find<RoomChatScreenController>();
    super.build(context);
    return Column(
      children: [
        AppPadding.small(
          child: _controller.value.isInitialized
              ? Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      child: _controller.value.isInitialized
                          ? AspectRatio(aspectRatio: _controller.value.aspectRatio, child: VideoPlayer(_controller))
                          : Container(),
                    ),
                    GestureDetector(
                      onTap: () => _controller.value.isPlaying ? _controller.pause() : _controller.play(),
                      child: AnimatedOpacity(
                        opacity: isPauseButtonVisible ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 500),
                        child: Icon(Icons.pause, color: ThemeColors.textDarkColor, size: kToolbarHeight / 1.5),
                      ),
                    ),
                    if (!isPlaying)
                      GestureDetector(
                        onTap: () => _controller.play(),
                        child: Icon(Icons.play_arrow, color: ThemeColors.textDarkColor, size: kToolbarHeight / 1.5),
                      ),
                    //Download icon
                    Positioned(
                      right: 8,
                      bottom: 8,
                      child: GestureDetector(
                        onTap: () => messageScreenController.downloadFile(widget.messageChat.lstFiles.first.fileUrl),
                        child: Icon(Icons.file_download, color: ThemeColors.textDarkColor, size: kToolbarHeight / 2),
                      ),
                    ),
                  ],
                )
              : AppLoading(isLoading: true),
        ),
        ChatMessageText(message: widget.messageChat.message, timestamp: widget.timestamp)
      ],
    );
  }
}
