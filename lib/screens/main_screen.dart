import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:status_saver_app/screens/video_screen.dart';

import '../provider/provider_class.dart';
import 'image_screen.dart';

class MineApp extends StatefulWidget {
  const MineApp({super.key});

  @override
  State<MineApp> createState() => _MineAppState();
}

class _MineAppState extends State<MineApp> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(
                color: Colors.white,

                themeProvider.isDarkMode
                    ? Icons
                          .dark_mode // 🌙 Dark mode icon
                    : Icons.light_mode, // ☀️ Light mode icon
              ),
              onPressed: () {
                themeProvider.toggleTheme(!themeProvider.isDarkMode);
              },
            ),
          ],
          title: Text("Status Saver", style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.teal.shade700,
          centerTitle: true,

          bottom: TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 3,
                color: themeProvider.isDarkMode
                    ? Colors.white
                    : Colors.deepPurple,

                // Thickness of the indicator
              ),
              insets: EdgeInsets.symmetric(horizontal: 65),
            ),

            labelStyle: TextStyle(fontWeight: FontWeight.bold),

            tabs: [
              Text("Images", style: TextStyle(fontSize: 20)),
              Text("Videos", style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
        body: TabBarView(children: [ImageScreen(), VideoScreen()]),
      ),
    );
  }
}
