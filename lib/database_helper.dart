import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqliteschool/provider_data.dart';

class Data{


DatabaseProvider db= DatabaseProvider();

getDatabase() async{
  await db.init();
}


insertAccount2Group( String cityName) async {
    // AcTypeID=-1;
    // AcGroupName="Pakistan";
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 
    'EasySoftDataFile.db');
    await getDatabase();
    var db = await databaseFactoryFfi.openDatabase(
      databasePath,options:OpenDatabaseOptions(singleInstance: false) );

String maxId = '''
    select -(IfNull(Max(Abs(BranchID)),0)+1) as MaxId from Sch1Branches"+" where ClientID=2
    ''';
    List list = await db.rawQuery(maxId);
  var maxID = list[0]['MaxId'].round();
    String query = '''
            insert into Sch1Branches
            (BranchID, BranchName, Address, ContactNo, LongLat, ClientID, ClientUserID, NetCode, SysCode, UpdatedDate) 
            values
            ($maxID, '$cityName', '','','',2,'','','','') 
    ''';

    try {
      var q = await db.rawInsert(query);
      db.close();
      print(q);
    }  catch (e) {

      print(e.toString());
    }
  }
  Future<List> readTableName()async{
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'EasySoftDataFile.db');
    var db = await databaseFactoryFfi.openDatabase(databasePath,options:OpenDatabaseOptions(singleInstance: false));
    String query = '''
      SELECT BranchName FROM Sch1Branches
      ''';
    List<dynamic> list=await db.rawQuery(query);
    return list;
  }
}