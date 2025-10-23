import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:status_saver_app/provider/get_viideo_image_provider.dart';
import 'package:status_saver_app/screens/InScreen/image_in_screen.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  late var isAvailAble = false;
  bool isWhatsUppHere = false;

  @override
  Widget build( BuildContext context) {

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
          return file.isWhatsUppHere == false ?
          Center(child: Text("No Whatsapp AvailAble Here"),) :
          file.getImage.isEmpty ?
          Center(child: Text("No Data Here"),) :
          GridView.builder(
            padding: EdgeInsets.all(10),
            itemCount: file.getImage.length,
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
                     onTap: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => ImageInScreen(image: file.getImage[index].path,),));
                     },
                     child: Container(
                       height: MediaQuery.of(context).size.height*0.5,
                       width: MediaQuery.of(context).size.width*0.4,
                       decoration: BoxDecoration(

                         borderRadius: BorderRadius.circular(5),
                         image: DecorationImage(fit: BoxFit.fill,image: FileImage(File(file.getImage[index].path)))
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
        }
      ),

  );


  }
}
