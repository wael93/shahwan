import 'dart:async';import 'dart:io';import 'package:flutter/material.dart';import 'package:path_provider/path_provider.dart';import 'package:sqflite/sqflite.dart';import 'package:path/path.dart';import 'package:shahwan/Model/ProductTabel.dart';class DatabaseHelper {  final String tableProduct = "tableProduct";  final String productID = "Id";  final String productName = "name";  final String sku = "sku";  final String options = "options";  final String price = "price";  final String quantity = "quantity";  final String spicalpriceFrom = "spicalpriceFrom";  final String spicalpriceTo = "spicalpriceTo";  final String productImage = "image";  final String optionTyprId = "optionTyprId";  final String sortOrder = "sortOrder";  final String productTabel = "productTabel";  final String ID = "id";  final String Name = "name";  final String userLastName = "userLastName";  final String default_code = "default_code";  final String product_uom_qty = "product_uom_qty";  final String userPhone = "userPhone";  final String userGender = "userGender";  final String userAccessToken = "userAccessToken";  // optionTyprId:optionList[1]['option_type_id'] , sortOrder:optionList[1]['sort_order']  //Singlton  DatabaseHelper._privateConstructor();  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();  DatabaseHelper.internal();  factory DatabaseHelper() => instance;  //Database reference   static Database? _db;  Future<Database?> get db async {    if (_db != null) {      return _db;    }    try{      _db = await initDb();      print("_db init");      return _db;    }    catch(err){      print(err);      return null;    }  }  initDb() async {    Directory documentDirectory = await getApplicationDocumentsDirectory();    print(documentDirectory);    String path = join(documentDirectory.path, "shahwan.db");    var ourDb = await openDatabase(path, version: 1, onCreate:_onCreate);    print("ourDb db");    print(ourDb);    return ourDb;  }  void _onCreate(Database db, int version) async {    await db.execute('CREATE TABLE $productTabel($ID integer primary key autoincrement, $Name TEXT NOT NULL, $default_code TEXT NOT NULL, $product_uom_qty TEXT NOT NULL )');  }  // //READ  // Future<int> saveProduct(Products products) async {  //   //will call get db from above  //   var dbClient = await db;  //   //result of insert is number  //   int result = await dbClient.insert(tableProduct, products.toMap());  //   return result;  // }  Future<int> SaveProduct(ProductTabel productTabell) async {    //will call get db from above    var dbClient = await db;    //result of insert is number    int result = await dbClient!.insert(productTabel, productTabell.toMap());    return result;  }  Future<List> get2Produc() async {    var dbClient = await db;    var result = await dbClient!.query(productTabel,columns: [default_code.toString(),product_uom_qty] );    return result.toList();  }  Future<int> updateCourse(ProductTabel productTabell) async{    var dbClient = await db;    return await dbClient!.update(productTabel, productTabell.toMap(),where: 'id = ?', whereArgs: [productTabell.id]);  }  Future<List> getAllProducts() async {    var dbClient = await db;    var result = await dbClient!.rawQuery("SELECT * FROM $productTabel", );    return result.toList();  }  // Future<List<ProductTabel>> getTowCulomn() async {  //   var dbClient = await db;  //   List<Map> maps = await dbClient!.query(productTabel,columns: ['default_code', 'product_uom_qty']);  //  //   List<ProductTabel> employees = [];  //   if (maps.length > 0) {  //     for (int i = 0; i < maps.length; i++) {  //       employees.add(ProductTabel.fromMap1(maps[i]));  //     }  //   }  //   return employees;  // }  // Future<List<ProductTabel>> getTowCulomn() async {  //   var dbClient = await db;  //   List<dynamic> maps = await dbClient!.query(productTabel, columns:  //   ['default_code', 'product_uom_qty']);  //   List<ProductTabel> employees = [];  //   if (maps.length > 0) {  //     for (int i = 0; i < maps.length; i++) {  //       employees.add(ProductTabel.fromMap(maps[i]) );  //     }  //   }  //   return employees;  // }  Future<List> getProduct() async {    try{      var dbClient = await db;      var result = await dbClient!.rawQuery("SELECT * FROM $productTabel");      print("RESELT"+result.toString());      return result.toList();      // return [];    }catch(err){      print(err);      return [];    }  }  Future<List> getProducttoJSON() async {    try{      var dbClient = await db;      var result = await dbClient!.rawQuery("SELECT * FROM $productTabel "          "WHERE:name = ?", ['default_code'] );      print("RESELT"+result.toString());      return result.toList();      // return [];    }catch(err){      print(err);      return [];    }  }  Future<int> deleteProduct(int productID) async {    var dbClient = await db;    return await dbClient!        .delete(tableProduct, where: "$productID = ?", whereArgs: [productID]);  }  // Future<int> updateUser(User user) async {  //   var dbClient = await db;  //   return await dbClient.update(tableProduct, user.toMap(),  //       where: "$productID = ? ", whereArgs: [user.id]);  // }  Future delet() async {    var dbClient = await db;    return dbClient!.delete(productTabel);  }  Future close() async {    var dbClient = await db;    return dbClient!.close();  }//End of Video 3}