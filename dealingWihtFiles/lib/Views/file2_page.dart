import 'dart:io';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class File2Page extends StatefulWidget {
  const File2Page({Key? key}) : super(key: key);

  @override
  State<File2Page> createState() => _File2PageState();
}

class _File2PageState extends State<File2Page> {
  bool downloading = false;

  String progress = '0';

  bool isDownloaded = false;

  // String uri = 'https://bjpcjp.github.io/pdfs/devops/linux-commands-handbook.pdf';
  String uri = 'https://journaldev.nyc3.digitaloceanspaces.com/2020/01/Top_50_Linux_Commands-1.png';
  String uri1= 'http://fintex-ye.com/assets/pdf/fbef2f71-2.pdf';
  Future<void> downloadFile(String uri, fileName) async {
    setState(() {
      isDownloaded = false;
      downloading = true;
    });
    final exFolder = await getExternalStorageDirectory();
    final epath = exFolder;
    print("========== ${epath} =========");

    final downloadPath = p.join(epath!.path, "myData");
    Directory downloadDir = await Directory(downloadPath).create();
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    String savePath = p.join(downloadDir.path, fileName+ "."+uri.split('.').last);
    Dio dio = Dio();

    dio.download(
      uri,
      savePath,
      onReceiveProgress: (rcv, total) {
        if (total != -1) {
          print(
              'received: ${rcv.toStringAsFixed(0)} out of total: ${total.toStringAsFixed(0)}');

             setState(() {
           // cur=rcv;
            //ttl= total;
            progress = ((rcv / total) * 100).toStringAsFixed(0);
          });
          //showNotifiy();
          if (progress == '100') {
            setState(() {
              isDownloaded = true;
            });
          } else if (double.parse(progress) < 100) {}
        }
      },
      deleteOnError: true,
    ).then((_) {
       setState(() {
        if (progress == '100') {
          isDownloaded = true;
        }

        downloading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [TextButton(onPressed: (){
          Navigator.of(context).pushNamed("/file");

        }, child: Text("File1", style: TextStyle(color: Colors.white),))],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              isDownloaded?Icon(Icons.check_circle_outline,color: Colors.green,):CircularProgressIndicator(
                color: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Colors.green),
                value: double.parse(progress)/100.00,
              ),
              Text('$progress%'),
              isDownloaded
                  ? Text(
                'File Downloaded! You can see your file in the application\'s directory',
              )
                  : Text(
                  'Click the FloatingActionButton to start Downloading!'),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        FloatingActionButton(
          heroTag: 1,
            onPressed: ()async{
              var res =await FilePicker.platform.pickFiles(
                  withData: true,
                  type: FileType.custom,
                  allowedExtensions: ["pdf"]
              );
              if(res !=null){
                PlatformFile fl = res.files.single;
                final dbFolder = await getExternalStorageDirectory();
                final epath = dbFolder;
                print("========== ${epath} =========");

                final imgsPath = p.join(epath!.path, "myData");
                Directory FolderDir = await Directory(imgsPath).create();
                /*var flist= await FolderDir.listSync();
                for(var item in flist){
                  if(item.runtimeType == Directory("n").runtimeType){
                    print("0000000000000000000000000000000000");
                  }
                  print("******** ${item.path} ******* ${item.runtimeType}*****");
                }*/

                String fname = DateTime.now().millisecondsSinceEpoch.toString();
                /*print("@@@@@@@@@ start @@@@@@@@@@");
            print(fl.name);
            print(fl.bytes);
            print(fl.size);*/
                print("@@@@@@@@@@ end @@@@@@@@@");
                File f = File(p.join(FolderDir.path,fname+"."+ fl.extension! ));
                //res.files.single.readStream!.listen((event) {print("================== EVENT: ${event}");});
                //   print(" -----Size: ${res.files.first.size}");
                // f.
                if(fl.bytes != null){
                  f.writeAsBytes(fl.bytes!,mode: FileMode.write);
                  print(" -----Size: ${res.files.first.size}");
                  // var open = await  OpenFile.open(f.path);
                  //  print("----- open result ${open.message} --------");
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("file is null")));
                }

              }
              else{
                print("file is null");
              }
            },
          child: Icon(Icons.folder),
        ),
        FloatingActionButton(
          heroTag: 2,
            child: Icon(Icons.update),
            onPressed: ()async{
              final dbFolder = await getExternalStorageDirectory();
              final epath = dbFolder;
              print("========== ${epath} =========");

              final imgsPath = p.join(epath!.path, "myData");
              Directory FolderDir = await Directory(imgsPath).create();
             var fList=await FolderDir.listSync();
             showDialog(context: context,
               builder: (context) => AlertDialog(
                 content: Container(
                   constraints: BoxConstraints(
                     maxWidth: 300,
                     maxHeight: 500,
                     minWidth: 300,
                     minHeight: 500
                   ),
                   child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                     itemCount: fList.length,
                       itemBuilder: (context, index) {
                         return GestureDetector(
                           onTap: ()async{
                          var res = await   OpenFile.open(fList[index].path);
                           },
                           child: Card(
                             child: Column(
                               children: [
                                 Icon(Icons.picture_as_pdf_outlined),
                                 Text("${fList[index].path.split("/").last}")
                               ],
                             ),
                           ),
                         );
                       },),
                 ),
               ),);

            }),
        FloatingActionButton(
          heroTag: 3,
            child: Icon(Icons.download_rounded),
            onPressed: ()async{
             await downloadFile("http://fintex-ye.com/assets/pdf/2f5b3074-c.pdf","name");
            })
      ],
    );
  }
}
