import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:status_saver_app/provider/get_viideo_image_provider.dart';

import 'package:status_saver_app/provider/provider_class.dart';

import 'package:status_saver_app/screens/main_screen.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
       ChangeNotifierProvider(create:(_)=> ThemeProvider()),
        ChangeNotifierProvider(create:(_)=> ApiProvider()),
      ],
      child:  const MyApp(),
    ),

  );
}

void permission() async {
  Map<Permission, PermissionStatus> result = await [
    Permission.storage,
    Permission.manageExternalStorage,
  ].request();
  if (result[Permission.storage] == PermissionStatus.granted &&
      result[Permission.manageExternalStorage] == PermissionStatus.granted){}

}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    permission();
    // TODO: implement initState
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Status App',
      themeMode: themeProvider.themeMode,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        tabBarTheme: TabBarThemeData(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
          bodyLarge: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
        ),
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        cardColor: Colors.grey[900],
        tabBarTheme: TabBarThemeData(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white,
        ),
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          bodySmall: TextStyle(color: Colors.white),
        ),
      ),
      home: MineApp(),
    );
  }
}
