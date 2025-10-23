import 'dart:io';

import 'package:flutter/material.dart';
import 'package:status_saver_app/screens/InScreen/video_in_screen.dart';

import '../provider/get_viideo_image_provider.dart';
import 'package:provider/provider.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late var isAvailAble = false;

  @override
  Widget build(BuildContext context) {
    late double height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      body: Consumer<ApiProvider>(
        builder: (context, file, child) {
          if (isAvailAble == false) {
            file.getData(".jpg");
            Future.delayed(const Duration(milliseconds: 1), () {
              isAvailAble = true;
            });
          }
          return file.isWhatsUppHere == false
              ? Center(child: Text("No Whatsapp AvailAble Here"))
              : file.getImage.isEmpty
              ? Center(child: Text("No Data Here"))
              : GridView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: file.getVideo.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 6,
                    mainAxisSpacing: 6,
                    childAspectRatio: .6,
                  ),
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 6,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => VideoInScreen(
                                    video: file.getVideo[index].path,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(
                                    File(file.getVideo[index].path),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: height * .02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [Icon(Icons.share), Icon(Icons.download)],
                          ),
                        ],
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
