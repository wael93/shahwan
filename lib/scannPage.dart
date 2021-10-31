import 'package:intl/intl.dart';import 'package:flutter/material.dart';import 'package:qrscan/qrscan.dart' as scanner;import 'package:flutter/services.dart';import 'package:shahwan/constants.dart';import 'package:flutter/cupertino.dart';import 'package:rflutter_alert/rflutter_alert.dart';import 'Database/sqlLite.dart';import 'dart:convert';import 'package:http/http.dart' as http ;import 'Homepage.dart';import 'package:shared_preferences/shared_preferences.dart';import 'package:shahwan/AppController.dart';import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';class Scanne extends StatefulWidget {  @override  _ScanneState createState() => _ScanneState();}class _ScanneState extends State<Scanne> {  bool check = true;  var alertStyle = AlertStyle(      alertPadding: EdgeInsets.only(top: 150, bottom: 150),      animationType: AnimationType.shrink,      isCloseButton: true,      isOverlayTapDismiss: true,      descStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 10),      animationDuration: Duration(milliseconds: 100),      alertBorder: RoundedRectangleBorder(        borderRadius: BorderRadius.circular(20.0),        side: BorderSide(          color: Colors.grey,        ),      ),      titleStyle: TextStyle(        color: Colors.red,      ),      constraints: BoxConstraints.expand(width: 300),      //First to chars "55" represents transparency of color      overlayColor: Color(0x55000000),      alertElevation: 10,      alertAlignment: Alignment.center);  var result;  List? allJson = [];  DatabaseHelper db = DatabaseHelper();   _scanQR() async {    try {      String? cameraScanResult = await scanner.scan();      var cameraScanResultNumber = cameraScanResult          .toString()          .substring(0, cameraScanResult.toString().indexOf('|'));      DateTime now = DateTime.now();      String formattedDate = DateFormat('dd/MM/yyyy').format(now);      var defaultCode = cameraScanResultNumber;      final prefs = await SharedPreferences.getInstance();      final login = prefs.getString('UserName');      final OdooApi = prefs.getString('OdooApi');      var data;      data = {        'database': "shahwan",        'login': login.toString(),        'OdooApi': OdooApi.toString(),        'default_code':defaultCode ,      };      print("data" + data.toString());      Post(Map body) async {        var url = Uri.parse("http://shahwan-qr.com:5000" + '/' +"view_product" );        print(url);        http.Response response = await http.post(url , headers: null , body: body );        if (response.statusCode == 200) {          var data = json.decode(response.body);          List product_qty = data["data"];          return product_qty;        } else {          return {};        }      };     return result=Post(data);    } on PlatformException catch (e) {      print(e);    }  }  @override  void initState() {    super.initState();    db = DatabaseHelper();  }  @override  Widget build(BuildContext context) {    setState(() {      result=result;      allJson=allJson;      print("object" + allJson.toString());      check = false;    });    // var bak = allJson[0]["BackPadding"]?? " s";    // var ClothColor = allJson[0]["ClothColor"];    // var Clothtype = allJson[0]["Clothtype"];    // print("object" + bak.toString());    return Scaffold(      appBar: AppBar(        centerTitle: true,        backgroundColor: ShahwanColor,        titleSpacing: 10,        title: Text("  ${AppController.strings.Spacific} " , style: TextStyle(fontSize: 14),),        leading: new IconButton(            icon: new Icon(Icons.arrow_back_ios_outlined),            onPressed: () =>  Navigator.of(context).pushReplacement(                MaterialPageRoute(                    builder: (context) => HomePage()))        ),      ),      body:result?.length!=0?      Padding(        padding: const EdgeInsets.all(2.0),        child: Column(          children: [            Container(              width: MediaQuery.of(context).size.width,              height: 40,              child: Row(                crossAxisAlignment: CrossAxisAlignment.center,                mainAxisAlignment: MainAxisAlignment.center,              children: [                Text("${ AppController.strings.SpacificValue}   "                  ,textAlign: TextAlign.center,                  style: TextStyle(                      color: ShahwanColor,                     fontWeight:FontWeight.bold,                      fontSize: 10),                ),                SizedBox(width: 5,),                Text("${ AppController.strings.value}   "                  ,textAlign: TextAlign.center,                  style: TextStyle(                      color: ShahwanColor,                      fontWeight:FontWeight.bold,                      fontSize: 10),                ),              ],            ),            ),            Container(              width: MediaQuery.of(context).size.width,              height: MediaQuery.of(context).size.height/2,              color: Colors.white,              child:SingleChildScrollView(             child: Column(                crossAxisAlignment: CrossAxisAlignment.center,                mainAxisAlignment: MainAxisAlignment.spaceEvenly,                children: [                  Text(allJson!.isEmpty ? "  ": "  ${allJson![0]["BackPadding"]} :  ${ AppController.strings.BackPadding}   "                    ,textAlign: TextAlign.center,                    style: TextStyle(                        color: Colors.black,                        fontSize: 10),                  ),                  Text(allJson!.isEmpty ? "  ": "  ${allJson![0]["ClothColor"]} :  ${ AppController.strings.ClothColor}   "                    ,textAlign: TextAlign.center,                    style: TextStyle(                        color: Colors.black,                        fontSize: 10),                  ),                  Text(allJson!.isEmpty ? "  ": "  ${allJson![0]["Clothtype"]} :  ${ AppController.strings.Clothtype}   "                    ,textAlign: TextAlign.center,                    style: TextStyle(                        color: Colors.black,                        fontSize: 10),                  ),                  Text(allJson!.isEmpty ? "  ": "  ${allJson![0]["DeliveryPeriod"]} :  ${ AppController.strings.DeliveryPeriod}   "                    ,textAlign: TextAlign.center,                    style: TextStyle(                        color: Colors.black,                        fontSize: 10),                  ),                  Text(allJson!.isEmpty ? "  ": "  ${allJson![0]["IronColor"]} :  ${ AppController.strings.IronColor}   "                    ,textAlign: TextAlign.center,                    style: TextStyle(                        color: Colors.black,                        fontSize: 10),                  ),                  Text(allJson!.isEmpty ? "  ": "  ${allJson![0]["MaterialUsed"]} :  ${ AppController.strings.MaterialUsed}   "                    ,textAlign: TextAlign.center,                    style: TextStyle(                        color: Colors.black,                        fontSize: 10),                  ),                  Text(allJson!.isEmpty ? "  ": "  ${allJson![0]["NoteProduct"]} :  ${ AppController.strings.NoteProduct}   "                    ,textAlign: TextAlign.center,                    style: TextStyle(                        color: Colors.black,                        fontSize: 10),                  ),                  Text(allJson!.isEmpty ? "  ": "  ${allJson![0]["NumberPillows"]} :  ${ AppController.strings.NumberPillows}   "                    ,textAlign: TextAlign.center,                    style: TextStyle(                        color: Colors.black,                        fontSize: 10),                  ),                  Text(allJson!.isEmpty ? "  ": "  ${allJson![0]["NumberSeats"]} :  ${ AppController.strings.NumberSeats}   "                    ,textAlign: TextAlign.center,                    style: TextStyle(                        color: Colors.black,                        fontSize: 10),                  ),                  Text(allJson!.isEmpty ? "  ": "  ${allJson![0]["ProductFeatures"]} :  ${ AppController.strings.ProductFeatures}   "                    ,textAlign: TextAlign.center,                    style: TextStyle(                        color: Colors.black,                        fontSize: 10),                  ),                  Text(allJson!.isEmpty ? "  ": "  ${allJson![0]["SeatPadding"]} :  ${ AppController.strings.SeatPadding}   "                    ,textAlign: TextAlign.center,                    style: TextStyle(                        color: Colors.black,                        fontSize: 10),                  ),                  Text(allJson!.isEmpty ? "  ": "  ${allJson![0]["WoodColor"]} :  ${ AppController.strings.WoodColor}   "                    ,textAlign: TextAlign.center,                    style: TextStyle(                        color: Colors.black,                        fontSize: 10),                  ),                  Text(allJson!.isEmpty ? "  ": "  ${allJson![0]["Woodtype"]} :  ${ AppController.strings.Woodtype}   "                    ,textAlign: TextAlign.center,                    style: TextStyle(                        color: Colors.black,                        fontSize: 10),                  ),                  Text(allJson!.isEmpty ? "  ": "  ${allJson![0]["country_id"]} :  ${ AppController.strings.country_id}   "                    ,textAlign: TextAlign.center,                    style: TextStyle(                        color: Colors.black,                        fontSize: 10),                  ),                  Text(allJson!.isEmpty ? "  ": "  ${allJson![0]["default_code"]} :  ${ AppController.strings.default_code}   "                    ,textAlign: TextAlign.center,                    style: TextStyle(                        color: Colors.black,                        fontSize: 10),                  ),                  Text(allJson!.isEmpty ? "  ": "  ${allJson![0]["id"]} :  ${ AppController.strings.id}   "                    ,textAlign: TextAlign.center,                    style: TextStyle(                        color: Colors.black,                        fontSize: 10),                  ),                  Text(allJson!.isEmpty ? "  ": "  ${allJson![0]["number_pieces"]} :  ${ AppController.strings.number_pieces}   ",                    textAlign: TextAlign.center,                    style: TextStyle(                        color: Colors.black,                        fontSize: 10),                  ),                ],              ),)            ),            Container(  child: Row(              crossAxisAlignment: CrossAxisAlignment.center,              mainAxisAlignment: MainAxisAlignment.center,              children: [                Text("${ AppController.strings.warehouse}   "                  ,textAlign: TextAlign.center,                  style: TextStyle(                      color: ShahwanColor,                      fontWeight:FontWeight.bold,                      fontSize: 10),                ),                SizedBox(width: 5,),                Text("${ AppController.strings.warehouseQ}   "                  ,textAlign: TextAlign.center,                  style: TextStyle(                      color: ShahwanColor,                      fontWeight:FontWeight.bold,                      fontSize: 10),                ),              ],            ),),            Expanded(child: ListView.builder(                shrinkWrap: true,                physics: ScrollPhysics(),                itemCount: result?.length?? 0,                itemBuilder: (context, index) {                  return Container(                      width: MediaQuery.of(context).size.width,                      height: 60,                      child: Padding(                        padding:                        EdgeInsets.symmetric(horizontal: 10, vertical: 5),                        child: Ink(                            color: Colors.white,                            child: ListTile(                              title: Row(                                crossAxisAlignment: CrossAxisAlignment.center,                                mainAxisAlignment: MainAxisAlignment.center,                                children: [                                  Padding(                                    padding: const EdgeInsets.all(5.0),                                    child: Center(                                        child: Row(                                          children: [                                            SizedBox(                                              height: 20,                                              width: MediaQuery.of(context)                                                  .size                                                  .width /                                                  5,                                              child: FittedBox(                                                fit: BoxFit.fitWidth,                                                child: Text(                                                  result[index]["warehouse_id"]                                                      .toString(),                                                  textAlign: TextAlign.center,                                                  style: TextStyle(                                                      color: Colors.black,                                                      fontStyle:                                                      FontStyle.italic ,                                                      fontSize: 10),                                                ),                                              ),                                            ),                                            SizedBox(                                              width: 15,                                            ),                                            SizedBox(                                              height: 18,                                              width: MediaQuery.of(context)                                                  .size                                                  .width /                                                  9,                                              child: FittedBox(                                                fit: BoxFit.fitWidth,                                                child: Text(                                                  result[index]["qty"].toString(),                                                  textAlign: TextAlign.center,                                                  style: TextStyle(                                                      color: Colors.black,                                                      fontStyle:                                                      FontStyle.normal , fontSize: 10),                                                ),                                              ),                                            ),                                          ],                                        )),                                  )                                ],                              ),                            )),                      ));                }),)          ],        ),      ):ModalProgressHUD(            inAsyncCall: false,       child: Center( child:Container( height: 100, width: 100,), ) ,       progressIndicator: const CircularProgressIndicator(),      ) ,            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,      floatingActionButton: Padding(        padding: const EdgeInsets.all(15.0),        child: Align(          alignment: Alignment.bottomCenter,          child: Container(            padding: EdgeInsets.only(top: 400, bottom: 10),            child: Row(              crossAxisAlignment: CrossAxisAlignment.center,              mainAxisAlignment: MainAxisAlignment.center,              children: <Widget>[                FloatingActionButton.extended(                  backgroundColor: ShahwanColor,                  onPressed: ()async {                 var printt = await _scanQR();                   var WaerHouse =   printt[0]["product_qty"];                 setState(() {                   allJson=printt;                   result=WaerHouse;                 });                    // calling a function when user click on button                  },                  icon: Icon(Icons.camera_alt_outlined),                  heroTag: Text("${AppController.strings.Scan.toString()}"),                  label: Text("${AppController.strings.Scan.toString()}"),                ),              ],            ),          ),        ),      ),    );  }}