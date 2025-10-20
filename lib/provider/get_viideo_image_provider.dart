import 'dart:io';

import 'package:flutter/cupertino.dart';




class ApiProvider extends ChangeNotifier{

  List<FileSystemEntity> getImage = [];
  List<FileSystemEntity> getVideo = [];
  
  bool isWhatsUppHere = false;
  
  getData( String endPoint){
     final directory = Directory("path/images/");
    if(directory.existsSync()){
      final item = directory.listSync();
      if(endPoint==".jpg"){
        getImage = item.where((element) => element.path.endsWith(".jpg"),).toList();
      }
      if(endPoint==".mp4"){
        getVideo = item.where((element) => element.path.endsWith(".mp4"),).toList();
      }
    }
    else
      {
        return isWhatsUppHere = false;
      }
  }
}