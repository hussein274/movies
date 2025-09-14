import 'package:flutter/material.dart';
import '../utils/app_colors.dart';
import '../utils/app_text_style.dart';
import '../utils/flutter_torrent_stream.dart';
import 'package:video_player/video_player.dart';

class TorrentPlayerPage extends StatefulWidget {
  final String torrentUrl;
  const TorrentPlayerPage({required this.torrentUrl, super.key});

  @override
  State<TorrentPlayerPage> createState() => _TorrentPlayerPageState();
}

class _TorrentPlayerPageState extends State<TorrentPlayerPage> {
  VideoPlayerController? _controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    startTorrent();
  }

  Future<void> startTorrent() async {
    final streamUrl = await FlutterTorrentStreamer.start(widget.torrentUrl);
    if (streamUrl != null) {
      _controller = VideoPlayerController.network(streamUrl)
        ..initialize().then((_) {
          setState(() {
            isLoading = false;
          });
          _controller!.play();
        });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    FlutterTorrentStreamer.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: AppColors.black,
          leading: IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.arrow_back_ios_new,color: AppColors.white,)),
          title: Text("Movie Player",style: AppTextStyle.RobotoW400_20.copyWith(color: AppColors.white))),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator(color: Colors.yellow)
            : AspectRatio(
          aspectRatio: _controller!.value.aspectRatio,
          child: VideoPlayer(_controller!),
        ),
      ),
    );
  }
}