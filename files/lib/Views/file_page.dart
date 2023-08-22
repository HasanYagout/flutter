import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class FilesPage extends StatefulWidget {
  const FilesPage({Key? key}) : super(key: key);

  @override
  State<FilesPage> createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Files"),),

      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          final params = OpenFileDialogParams(
            dialogType: OpenFileDialogType.image,
            sourceType: SourceType.savedPhotosAlbum,
          );
          final filePath = await FlutterFileDialog.pickFile(params: params);
          /*File f = File.fromUri(Uri.file(filePath!));
          print("--------- FF: ${await f.create()}");
          final dbFolder = await getExternalStorageDirectory();
          final imgsPath = p.join(dbFolder!.path, "Images");
          Directory FolderDir = await Directory(imgsPath).create();
          String fname = DateTime.now().millisecondsSinceEpoch.toString();*/

          final params1 = SaveFileDialogParams(sourceFilePath: filePath);
          final filePath1 = await FlutterFileDialog.saveFile(params: params1);
          print(filePath);
         /* var res =await FilePicker.platform.pickFiles(allowMultiple: false, allowedExtensions: ["pdf"], type: FileType.custom);
          if(res !=null){

            final dbFolder = await getExternalStorageDirectory();
            final imgsPath = p.join(dbFolder!.path, "Images");
            Directory FolderDir = await Directory(imgsPath).create();
            String fname = DateTime.now().millisecondsSinceEpoch.toString();
            print("@@@@@@@@@@@@@@@@@@@EXT: ${res.files.single.extension!}");
            print("@@@@@@@@@@@@@@@@@@@EXT: ${fname}");
            File f = File("/data/user/0/com.example.doctor/cache/file_picker/Abood.pdf");
            //res.files.single.readStream!.listen((event) {print("================== EVENT: ${event}");});
            print(" -----Size: ${res.files.first.size}");
           // f.
            if(res.files.single.bytes != null){
              //f.writeAsBytes(,mode: FileMode.write);
              print(" -----Size: ${res.files.first.size}");
            }
            else{
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("file is null")));
            }

          }
          else{
            print("file is null");
          }*/
        },
        child: Icon(Icons.folder),
      ),
    );
  }
}
