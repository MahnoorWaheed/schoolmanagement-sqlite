import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseProvider with ChangeNotifier{
  List tableDetailList=[];
  List<dynamic> tableColumnName=[];
  List groupSetList=[];
  String layoutName="";
  Future<void> init()async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //print("file path $documentsDirectory");
    String path = join(documentsDirectory.path, 'asset_EasySoftDataFile.db');
    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound){
      print("File not found");
      //ByteData data = await rootBundle.load(join('assets/database', 'test.db'));
      ByteData data = await rootBundle.load(join('assets/database/EasySoftDataFile.db'));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Save copied asset to documents
      await new File(path).writeAsBytes(bytes);

    }
  }
}