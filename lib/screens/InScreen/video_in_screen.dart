import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_api/flutter_native_api.dart';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:video_player/video_player.dart';

import '../../utils/flutter_toast.dart' as Utils;


class VideoInScreen extends StatefulWidget {
  final String? video;
  const VideoInScreen({super.key, required this.video});

  @override
  State<VideoInScreen> createState() => _VideoInScreenState();
}

class _VideoInScreenState extends State<VideoInScreen> {

  ChewieController? _chewieController;

  @override
  void initState() {
    _chewieController = ChewieController(
       autoInitialize:  true,
       looping: true,
       aspectRatio: 6/7,
      errorBuilder: ((error,context){
        Utils.flutterToastMessage(error.toString());
        return Center(child: Text("error in toastmsg in chewicontroller in video_in_screen"));
      }),
       videoPlayerController: VideoPlayerController.file(File(widget.video!)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Chewie(controller: _chewieController!),
        floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: "Share Image",
              onPressed: () {
                ImageGallerySaver.saveFile(widget.video!).then((value) {
                  Utils.flutterToastMessage("Share Successfully");
                }).onError((error, stackTrace) {
                  Utils.flutterToastMessage(error.toString());
                });
              },


              child: Icon(Icons.share),),
            FloatingActionButton(
              heroTag: "Save Image",
              onPressed: (){
                FlutterNativeApi.shareImage(widget.video!);

              },child: Icon(Icons.save_alt),),
          ],
        ),
    );
  }
}
