import 'dart:math';import 'package:intl/intl.dart';import 'package:flutter/material.dart';import 'package:qrscan/qrscan.dart' as scanner;import 'package:flutter/services.dart';import 'package:shahwan/constants.dart';import 'package:flutter/cupertino.dart';import 'package:rflutter_alert/rflutter_alert.dart';import 'Database/sqlLite.dart';import 'dart:convert';import 'package:http/http.dart' as http ;import 'Homepage.dart';class Scanne extends StatefulWidget {  @override  _ScanneState createState() => _ScanneState();}class _ScanneState extends State<Scanne> {  var alertStyle = AlertStyle(      alertPadding: EdgeInsets.only(top: 150, bottom: 150),      animationType: AnimationType.shrink,      isCloseButton: true,      isOverlayTapDismiss: true,      descStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 10),      animationDuration: Duration(milliseconds: 100),      alertBorder: RoundedRectangleBorder(        borderRadius: BorderRadius.circular(20.0),        side: BorderSide(          color: Colors.grey,        ),      ),      titleStyle: TextStyle(        color: Colors.red,      ),      constraints: BoxConstraints.expand(width: 300),      //First to chars "55" represents transparency of color      overlayColor: Color(0x55000000),      alertElevation: 10,      alertAlignment: Alignment.center);  var result;  DatabaseHelper db = DatabaseHelper();   _scanQR() async {    try {      String? cameraScanResult = await scanner.scan();      var cameraScanResultNumber = cameraScanResult          .toString()          .substring(0, cameraScanResult.toString().indexOf('|'));      DateTime now = DateTime.now();      String formattedDate = DateFormat('dd/MM/yyyy').format(now);      var defaultCode = cameraScanResultNumber;      var data;      data = {        'database': 'shahwan',        'login': 'admin',        'OdooApi': 'sgsdsfdgfdbrberb',        'default_code':defaultCode ,      };      print("data" + data.toString());      Post(Map body) async {        var url = Uri.parse("http://shahwan-qr.com:5000" + '/' +"view_product" );        print(url);        http.Response response = await http.post(url , headers: null , body: body );        if (response.statusCode == 200) {          var data = json.decode(response.body);          List product_qty = data["data"][0]["product_qty"];          return product_qty;        } else {          return {};        }      };     return result=Post(data);    } on PlatformException catch (e) {      print(e);    }  }  @override  void initState() {    super.initState();    db = DatabaseHelper();  }  @override  Widget build(BuildContext context) {    setState(() {      result=result;    });    return Scaffold(      appBar: AppBar(        centerTitle: true,        backgroundColor: ShahwanColor,        titleSpacing: 20,        title: Text(" المواصفات والكميات "),        leading: new IconButton(            icon: new Icon(Icons.arrow_back_ios_outlined),            onPressed: () =>  Navigator.of(context).pushReplacement(                MaterialPageRoute(                    builder: (context) => HomePage()))        ),      ),      body:  ListView.builder(                shrinkWrap: true,                physics: ScrollPhysics(),                itemCount: result?.length?? 0,                itemBuilder: (context, index) {                  return Container(                      width: MediaQuery.of(context).size.width,                      height: 100,                      child: Padding(                        padding:                        EdgeInsets.symmetric(horizontal: 10, vertical: 5),                        child: Ink(                            color: Colors.grey[100],                            child: ListTile(                                title: Row(                                  crossAxisAlignment: CrossAxisAlignment.center,                                  mainAxisAlignment: MainAxisAlignment.center,                                  children: [                                    Padding(                                      padding: const EdgeInsets.all(5.0),                                      child: Center(                                          child: Row(                                            children: [                                              SizedBox(                                                height: 20,                                                width: MediaQuery.of(context)                                                    .size                                                    .width /                                                    2,                                                child: FittedBox(                                                  fit: BoxFit.fitWidth,                                                  child: Text(                                                   result[index]["warehouse_id"]                                                       .toString(),                                                    textAlign: TextAlign.center,                                                    style: TextStyle(                                                        color: Colors.black,                                                        fontStyle:                                                        FontStyle.italic ,                                                        fontSize: 40),                                                  ),                                                ),                                              ),                                              SizedBox(                                                width: 25,                                              ),                                              SizedBox(                                                height: 18,                                                width: MediaQuery.of(context)                                                    .size                                                    .width /                                                    7,                                                child: FittedBox(                                                  fit: BoxFit.cover,                                                  child: Text(                                                    result[index]["qty"]                                                        .toString(),                                                    textAlign: TextAlign.justify,                                                    style: TextStyle(                                                        color: Colors.black,                                                        fontStyle:                                                        FontStyle.normal),                                                  ),                                                ),                                              ),                                            ],                                          )),                                    )                                  ],                                ),                            )),                      ));                }),      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,      floatingActionButton: Padding(        padding: const EdgeInsets.all(15.0),        child: Align(          alignment: Alignment.bottomCenter,          child: Container(            padding: EdgeInsets.only(top: 400, bottom: 10),            child: Row(              crossAxisAlignment: CrossAxisAlignment.center,              mainAxisAlignment: MainAxisAlignment.center,              children: <Widget>[                FloatingActionButton.extended(                  backgroundColor: ShahwanColor,                  onPressed: ()async {                 var printt = await _scanQR();                 setState(() {                   result=printt;                 });                 print("object" + printt);                    // calling a function when user click on button                  },                  icon: Icon(Icons.camera_alt_outlined),                  label: Text("مسح"),                ),              ],            ),          ),        ),      ),    );  }}