import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late double height = MediaQuery.of(context).size.height * 1;
  late double width = MediaQuery.of(context).size.width * 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
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
                    "assets/images/shoes.one.jpg",
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: height * .29,
                  ),

                  SizedBox(height: height*.02),
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
      ),
    );
  }
}
