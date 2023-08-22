import 'dart:io';

import 'package:dio/dio.dart';
import 'package:doctor/main.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class FilesPage extends StatefulWidget {
  const FilesPage({Key? key}) : super(key: key);

  @override
  State<FilesPage> createState() => _FilesPageState();
}

class _FilesPageState extends State<FilesPage> {
  int cur=1;
  int ttl =100;
  void showNotifiy()async{
    flutterLocalNotificationsPlugin.show(
        1, "local title", "local notification body",
        NotificationDetails(
          android: AndroidNotificationDetails(
            fullScreenIntent: true,
            onlyAlertOnce: true,
            priority: Priority.high,
            visibility: NotificationVisibility.public,
            channelShowBadge: true,
            category: AndroidNotificationCategory.error,
            colorized: true,
            actions: <AndroidNotificationAction>[
              AndroidNotificationAction("a1", "Remove"),
              AndroidNotificationAction("a2", "Accept"),
            ],
            channel.id,
            channel.name,
            maxProgress: ttl,
            progress: cur,
            showProgress: true,
            styleInformation: BigTextStyleInformation(
                "Test Notify",
                summaryText: "summary text",
                contentTitle: "<h2>Content Title<h2>",
                htmlFormatBigText: true,
                htmlFormatContentTitle: true,
                htmlFormatSummaryText: true,
                htmlFormatContent: true
            ),
            // channel.description,
            color: Colors.blue,
            // TODO add a proper drawable resource to android, for now using
            //      one that already exists in example app.
            icon: "@mipmap/ic_launcher",
          ),
        ),
        payload: "/login"
    );
  }
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

       /*   setState(() {
            cur=rcv;
            ttl= total;
            progress = ((rcv / total) * 100).toStringAsFixed(0);
          });
          showNotifiy();
          if (progress == '100') {
            setState(() {
              isDownloaded = true;
            });
          } else if (double.parse(progress) < 100) {}*/
        }
      },
      deleteOnError: true,
    ).then((_) {
     /* setState(() {
        if (progress == '100') {
          isDownloaded = true;
        }

        downloading = false;
      });*/
    });
  }
  List<String> allPaths= [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Files"),),
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
      /*body: Container(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemCount: allPaths.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: ()async{
                  var res = await OpenFile.open(allPaths[index]);
                },
                child: Card(
                  child: Column(
                    children: [
                      Icon(Icons.picture_as_pdf),
                      Text(allPaths[index])
                    ],
                  ),
                ),
              );
            },),
      ),*/
      persistentFooterButtons: [
        FloatingActionButton(
          heroTag: 4,
            child: Icon(Icons.play_arrow),
            onPressed: ()async{
            await downloadFile(uri1, "test.pdf");
            }),
        FloatingActionButton(
          heroTag: 3,
            onPressed: ()async{
              List<String> paths=[];
              final dbFolder = await getExternalStorageDirectory();
              final epath = dbFolder!.parent;
              print("========== ${epath} =========");

              final imgsPath = p.join(epath!.path, "downloads");
              Directory FolderDir = await Directory(imgsPath).create();

              var flist= await FolderDir.listSync();

              for(var item in flist){
                paths.add(item.path);
                if(item.runtimeType == Directory("n").runtimeType){
                  print("0000000000000000000000000000000000");
                }

                print("******** ${item.path} ******* ${item.runtimeType}*****");
              }

              setState(() {
                allPaths= paths;
              });
              showDialog(context: context, builder: (context) => AlertDialog(
                content: Container(
                  constraints: BoxConstraints(
                    minHeight: 500,
                    minWidth: 300,
                    maxHeight: 500,
                    maxWidth: 300
                  ),
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemCount: allPaths.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: ()async{
                          var res = await OpenFile.open(allPaths[index]);
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(child: allPaths[index].split(".").last=="pdf"?
                              Icon(Icons.picture_as_pdf,color: Colors.blue,):
                              Icon(Icons.image,color: Colors.blue,)
                              ),
                              Expanded(child: Text(allPaths[index].split("/").last))
                            ],
                          ),
                        ),
                      );
                    },),
                ),
              ),);
            },
          child: Icon(Icons.update),
        ),
        FloatingActionButton(
            heroTag: 2,
            onPressed: (){
          showNotifiy();
        }),
      ],
      floatingActionButton: FloatingActionButton(
        heroTag: 1,
        onPressed: () async{
         /* final params = OpenFileDialogParams(
            dialogType: OpenFileDialogType.image,
            sourceType: SourceType.savedPhotosAlbum,
          );
          final filePath = await FlutterFileDialog.pickFile(params: params);*/
          /*File f = File.fromUri(Uri.file(filePath!));
          print("--------- FF: ${await f.create()}");
          final dbFolder = await getExternalStorageDirectory();
          final imgsPath = p.join(dbFolder!.path, "Images");
          Directory FolderDir = await Directory(imgsPath).create();
          String fname = DateTime.now().millisecondsSinceEpoch.toString();*/

         /* final params1 = SaveFileDialogParams(sourceFilePath: filePath);
          final filePath1 = await FlutterFileDialog.saveFile(params: params1);
          print(filePath);*/
          var res =await FilePicker.platform.pickFiles(
              withData: true,
            type: FileType.custom,
            allowedExtensions: ["pdf"]
          );
          if(res !=null){
            PlatformFile fl = res.files.first;
            final dbFolder = await getExternalStorageDirectory();
            final epath = dbFolder!.parent;
            print("========== ${epath} =========");

            final imgsPath = p.join(epath!.path, "myImages");
            Directory FolderDir = await Directory(imgsPath).create();
            var flist= await FolderDir.listSync();
            for(var item in flist){
              if(item.runtimeType == Directory("n").runtimeType){
                print("0000000000000000000000000000000000");
              }
              print("******** ${item.path} ******* ${item.runtimeType}*****");
            }

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
            if(res.files.first.bytes != null){
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
    );
  }
}
