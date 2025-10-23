import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_native_api/flutter_native_api.dart';
import 'package:vm_service/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import '../../utils/flutter_toast.dart' as Utils;


class ImageInScreen extends StatefulWidget {
   final String? image;

  const ImageInScreen({super.key,required this.image});

  @override
  State<ImageInScreen> createState() => _ImageInScreenState();
}

class _ImageInScreenState extends State<ImageInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
      Container(
        decoration: BoxDecoration(
          
        ),
        child: Image(

            image: FileImage(File(widget.image!))),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "Share Image",
          onPressed: () {
            ImageGallerySaver.saveFile(widget.image!).then((value) {
              Utils.flutterToastMessage("Share Successfully");
            }).onError((error, stackTrace) {
              Utils.flutterToastMessage(error.toString());
            });
          },


          child: Icon(Icons.share),),
          FloatingActionButton(
            heroTag: "Save Image",
            onPressed: (){
              FlutterNativeApi.shareImage(widget.image!);

            },child: Icon(Icons.save_alt),),
        ],
      ),
    );
  }
}
