import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:status_saver_app/provider/get_viideo_image_provider.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  late double height = MediaQuery.of(context).size.height * 1;
  late double width = MediaQuery.of(context).size.width * 1;
  late var isAvailAble = false;
  bool isWhatsUppHere = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ApiProvider>(
        builder: (context, file, child) {
          if (isAvailAble == false) {
            file.getData(".jpg");
            Future.delayed(const Duration(milliseconds: 1), () {
              isAvailAble = false;
            });
          }
          return file.isWhatsUppHere == false ?
          Center(child: Text("No Whatsapp AvailAble Here"),) :
          file.getImage.isEmpty ?
          Center(child: Text("No Data Here"),) :
          GridView.builder(
            padding: EdgeInsets.all(10),
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
              childAspectRatio: .6,
            ),
            itemBuilder: (context, index) {
              return Card(
                elevation: 6,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/free.one.jpg",
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: height * .29,
                      ),

                      SizedBox(height: height * .02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [Icon(Icons.share), Icon(Icons.download)],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
      ),

  );


  }
}
