import 'package:intl/intl.dart';import 'package:flutter/material.dart';import 'package:qrscan/qrscan.dart' as scanner;import 'package:flutter/services.dart';import 'package:shahwan/Services/service.dart';import 'package:shahwan/Model/ProductTabel.dart';import 'package:shahwan/constants.dart';import 'package:shared_preferences/shared_preferences.dart';import 'package:flutter/cupertino.dart';import 'package:rflutter_alert/rflutter_alert.dart';import 'Database/sqlLite.dart';class QRViewExample extends StatefulWidget {  @override  _QRViewExampleState createState() => _QRViewExampleState();}class _QRViewExampleState extends State<QRViewExample> {  String result = "Hello Worlderer..!";  String Name = "Hello Worlderer..!";  var DataTabel1;  var alertStyle = AlertStyle(      alertPadding: EdgeInsets.only(top: 150, bottom: 150),      animationType: AnimationType.shrink,      isCloseButton: true,      isOverlayTapDismiss: true,      descStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 10),      animationDuration: Duration(milliseconds: 100),      alertBorder: RoundedRectangleBorder(        borderRadius: BorderRadius.circular(20.0),        side: BorderSide(          color: Colors.grey,        ),      ),      titleStyle: TextStyle(        color: Colors.red,      ),      constraints: BoxConstraints.expand(width: 300),      //First to chars "55" represents transparency of color      overlayColor: Color(0x55000000),      alertElevation: 10,      alertAlignment: Alignment.center);  DatabaseHelper db = DatabaseHelper();  Future _scanQR() async {    try {      String? cameraScanResult = await scanner.scan();      // print("cameraScanResult" + cameraScanResult.toString());      var cameraScanResultNumber = cameraScanResult          .toString()          .substring(0, cameraScanResult.toString().indexOf('|'));      var cameraScanResultName = cameraScanResult.toString().substring(          cameraScanResult.toString().indexOf('|\$\$|') + 4,          cameraScanResult.toString().indexOf('-'));      // var  code = cameraScanResult.toString().split(' ');      // print("cameraScanResult>>>>>>>>" + cameraScanResultNumber.toString());      // print("cameraScanResultName >>>>>>" + cameraScanResultName.toString());      var name = cameraScanResultName;      var defaultCode = cameraScanResultNumber;      var productUomQty = ' '.toString();      db.SaveProduct(new ProductTabel(          name.toString(), defaultCode.toString(), productUomQty));      // var data = {      //   'database': 'shahwan',      //   'login': 'admin',      //   'OdooApi': 'sgsdsfdgfdbrberb',      //   'date': formattedDate,      //   'qrcode_sale_form_line_ids': DataTabel1.toString(),      // };      // print("data" + data.toString());      // var result1 = await Service("qrcode_receive").Post(data);      // print("result" + result1.toString());      setState(() {        result = cameraScanResultNumber.toString();        Name = cameraScanResultName.toString();        // setting string        // result with        // cameraScanResult      });    } on PlatformException catch (e) {      print(e);    }  }  Future _send() async {    DateTime now = DateTime.now();    String formattedDate = DateFormat('dd/MM/yyyy').format(now);    var all = await db.getAllProducts();    print("ALL>>>>" + all.toString());    final prefs = await SharedPreferences.getInstance();    final shahwan = prefs.getString('shahwan');    final login = prefs.getString('UserName');    final OdooApi = prefs.getString('OdooApi');    var data;    data = {      'database': shahwan,      'login': "admin",      'OdooApi': "sgsdsfdgfdbrberb",      'date': formattedDate,      'qrcode_sale_form_line_ids':          '[{"default_code":"0001013073","product_uom_qty":10},{"default_code":"0001013075","product_uom_qty":4}]',    };    print("data >>>> " + data.toString());    data = await Service("qrcode_receive").Post(data);    print("result" + data.toString());    //{'message': 'Qrcode Sale Created', 'result': 'success', 'Reference': 450, 'new_qrcode_sale_id': '235'}    if (data['result'] == 'success') {      Alert(        context: context,        style: alertStyle,        title: "تمت العملية بنجاح ",        desc: "  الرقم المرجعي = ${data['Reference']}",        image: Image(            height: 60,            width: 60,            image: AssetImage("asset/images/success-icon-23187.png")),        buttons: [          DialogButton(            child: Text(              "تم",              style: TextStyle(color: Colors.white, fontSize: 20),            ),            onPressed: () => Navigator.pop(context),            color: ShahwanColor,            radius: BorderRadius.circular(20.0),          ),        ],      ).show();    } else {      Alert(        context: context,        style: alertStyle,        title: "حدث خطاء في الارسال",        desc: "  حاول التاكد من المدخلات",        image: Image(            height: 60,            width: 60,            image: AssetImage("asset/images/PngItem_6273493.png")),        buttons: [          DialogButton(            child: Text(              "تم",              style: TextStyle(color: Colors.white, fontSize: 20),            ),            onPressed: () => Navigator.pop(context),            color: ShahwanColor,            radius: BorderRadius.circular(20.0),          ),        ],      ).show();    }  }  @override  Widget build(BuildContext context) {    return Scaffold(      appBar: AppBar(        centerTitle: true,        backgroundColor:ShahwanColor ,        titleSpacing:50 ,        title: Text(" المواصفات والكميات ") , ),      body: Center(          child: Column(        children: [          DataTable(            columns: const <DataColumn>[              DataColumn(                label: Text(                  'الاسم',                  style: TextStyle(fontStyle: FontStyle.italic),                ),              ),              DataColumn(                label: Text(                  'الرقم',                  style: TextStyle(fontStyle: FontStyle.italic),                ),              ),              DataColumn(                label: Text(                  'الكمية',                  style: TextStyle(fontStyle: FontStyle.italic),                ),              ),            ],            rows: const <DataRow>[              DataRow(                cells: <DataCell>[                  DataCell(Text('Sarah')),                  DataCell(Text('19')),                  DataCell(Text('Student')),                ],              ),            ],          )          // Text(Data.toString()),        ],      ) // Here the scanned result will          // be shown          ),      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,      floatingActionButton: Align(        alignment: Alignment.bottomCenter,        child: Container(          padding: EdgeInsets.only(top: 400, bottom: 10),          child: Column(            crossAxisAlignment: CrossAxisAlignment.center,            mainAxisAlignment: MainAxisAlignment.center,            children: <Widget>[              SizedBox(                height: 1,              ),              FloatingActionButton.extended(                onPressed: () {                  _send();                  // calling a function when user click on button                },                icon: Icon(Icons.arrow_back),                label: Text("حفظ"),              ),              SizedBox(                height: 20,              ),              FloatingActionButton.extended(                onPressed: () {                  _scanQR();                  // calling a function when user click on button                },                icon: Icon(Icons.arrow_forward),                label: Text("مسح"),              ),            ],          ),        ),      ),      // floatingActionButton: FloatingActionButton.extended(      //     icon: Icon(Icons.camera_alt),      //     onPressed: () {      //       _scanQR();      //      //       // calling a function when user click on button      //     },      //     label: Text("Scan")),      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,    );  }}//// _onAlertWithCustomImagePressed(context) {//   Alert(//     context: context,//     title: "RFLUTTER ALERT",//     desc: "Flutter is more awesome with RFlutter Alert.",//     image: Image.asset("assets/success.png"),//   ).show();// }