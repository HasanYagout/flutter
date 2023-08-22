import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart'as p;

class FilesProvider extends ChangeNotifier{
  Future<String> exPath()async{
    var d= await getExternalStorageDirectory();
    return d!.path;
  }
  Future<String> saveFile(PlatformFile file)async{
    try{
      if(file != null){
        var ex = await exPath();
        var pth = p.join(ex,"media");
        var dir= Directory(pth).create();
        File f= File("path");
      }
      return "";
    }
    catch(e){
      return "";
    }
  }
}