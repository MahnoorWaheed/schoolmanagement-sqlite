import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqliteschool/provider_data.dart';

class Data{

String batchName;
int? id;
DatabaseProvider db= DatabaseProvider();

Data({required this.batchName});

factory Data.fromJson(Map<String, dynamic> json){
  return Data(batchName: json['batchName']);

}
getDatabase() async{
  await db.init();
}


insertAccount2Group(int AcTypeID, String AcGroupName,BuildContext context) async {
    // AcTypeID=-1;
    // AcGroupName="Pakistan";
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 
    'asset_EasySoftDataFile.db');
    await getDatabase();
    var db = await databaseFactoryFfi.openDatabase(databasePath, );

    String maxId = '''
    select -(IfNull(Max(Abs(AcGroupID)),0)+1) as MaxId from Account2Group"+" where ClientID=$id
    ''';
    List list=await db.rawQuery(maxId);
    var maxID = list[0]['MaxId'].round();
    String query = '''
            insert into Account2Group
            (id,batchName) 
            values
            ($batchName) 
    ''';

    try {
      var q = await db.rawInsert(query);
      db.close();
      print(q);
    }  catch (e) {

      print(e.toString());
    }
  }
}