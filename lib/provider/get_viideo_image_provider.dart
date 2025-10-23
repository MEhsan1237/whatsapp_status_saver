import 'dart:io';

import 'package:flutter/cupertino.dart';




class ApiProvider extends ChangeNotifier{

  List<FileSystemEntity> getImage = [];
  List<FileSystemEntity> getVideo = [];
  
  bool isWhatsUppHere = false;
  
  getData( String endPoint){
     final directory = Directory("All files/Internal storage/WhatsApp/Media/.statuses");
    if(directory.existsSync()){
      final item = directory.listSync();

      isWhatsUppHere = true;
      notifyListeners();
      if(endPoint==".jpg"){
        getImage = item.where((element) => element.path.endsWith(".jpg"),).toList();
         notifyListeners();
      }
      else{
        getVideo = item.where((element) => element.path.endsWith(".mp4"),).toList();
        notifyListeners();
      }
    }
    else
      {
         isWhatsUppHere = false;
        notifyListeners();
      }
  }
}