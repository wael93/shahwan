import 'dart:convert';import 'dart:math';import 'package:intl/intl.dart';import 'package:flutter/material.dart';import 'package:qrscan/qrscan.dart' as scanner;import 'package:flutter/services.dart';import 'package:shahwan/Services/service.dart';import 'package:shahwan/Model/ProductTabel.dart';import 'package:shahwan/constants.dart';import 'package:shared_preferences/shared_preferences.dart';import 'package:flutter/cupertino.dart';import 'package:rflutter_alert/rflutter_alert.dart';import 'Database/sqlLite.dart';import 'package:font_awesome_flutter/font_awesome_flutter.dart';import 'package:shahwan/AppController.dart';import 'Homepage.dart';class QRViewExample extends StatefulWidget {  @override  _QRViewExampleState createState() => _QRViewExampleState();}class _QRViewExampleState extends State<QRViewExample> {  // String result = "Hello Worlderer..!";  // String Name = "Hello Worlderer..!";  var DataTabel1;  final _textFieldController = TextEditingController(text: " ");  var alertStyle = AlertStyle(      alertPadding: EdgeInsets.only(top: 150, bottom: 150),      animationType: AnimationType.shrink,      isCloseButton: true,      isOverlayTapDismiss: true,      descStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),      animationDuration: Duration(milliseconds: 100),      alertBorder: RoundedRectangleBorder(        borderRadius: BorderRadius.circular(20.0),        side: BorderSide(          color: Colors.grey,        ),      ),      titleStyle: TextStyle(        color: Colors.red,      ),      constraints: BoxConstraints.expand(width: 300),      //First to chars "55" represents transparency of color      overlayColor: Color(0x55000000),      alertElevation: 10,      alertAlignment: Alignment.center);  DatabaseHelper db = DatabaseHelper();  Future _scanQR() async {    try {      String? cameraScanResult = await scanner.scan();      // print("cameraScanResult" + cameraScanResult.toString());      var cameraScanResultNumber = cameraScanResult          .toString()          .substring(0, cameraScanResult.toString().indexOf('|'));      var cameraScanResultName = cameraScanResult.toString().substring(          cameraScanResult.toString().indexOf('|\$\$|') + 4,          cameraScanResult.toString().indexOf('-'));      // var  code = cameraScanResult.toString().split(' ');      // print("cameraScanResult>>>>>>>>" + cameraScanResultNumber.toString());      // print("cameraScanResultName >>>>>>" + cameraScanResultName.toString());      var name = cameraScanResultName;      String defaultCode = cameraScanResultNumber.toString();      int productUomQty = 1;      db.SaveProduct(          new ProductTabel(null, name.toString(), defaultCode, productUomQty              .toInt()));      (BuildContext context) {        Scaffold(          appBar: AppBar(            centerTitle: true,            backgroundColor: ShahwanColor,            titleSpacing: 20,            title: Text(" ${   cameraScanResultNumber.toString()} "),            leading: new IconButton(                icon: new Icon(Icons.arrow_back_ios_outlined),                onPressed: () => Navigator.of(context).pushReplacement(                    MaterialPageRoute(builder: (context) => HomePage()))),          ),);      };      setState(() {        // result = cameraScanResultNumber.toString();        // Name = cameraScanResultName.toString();        // setting string        // result with        // cameraScanResult      });    } on PlatformException catch (e) {      print(e);    }  }  Future _send() async {    // List printJson(String input) {    //   const JsonDecoder decoder = JsonDecoder();    //   const JsonEncoder encoder = JsonEncoder.withIndent('  ');    //   final dynamic object = decoder.convert(input);    //   final dynamic prettyString = encoder.convert(object);    //   return prettyString.split('\n').forEach((dynamic element) => print    //     (element));    // }    DateTime now = DateTime.now();    String formattedDate = DateFormat('yyyy/MM/dd').format(now);    var all = await db.getAllProducts();    print("ALL>>>>" + all.toString());    final prefs = await SharedPreferences.getInstance();    final shahwan = prefs.getString('shahwan');    final login = prefs.getString('UserName');    final OdooApi = prefs.getString('OdooApi');    List update = await db.get2Produc();     // print("jsonEncode(body) " + jsonEncode(update) );     var json = jsonEncode(update);    var data;    var data2 = {      'database': shahwan.toString(),      'login':login.toString(),      'OdooApi':OdooApi.toString(),      'date': formattedDate,      'qrcode_sale_form_line_ids': json.toString(),    };    print("data 2222  >>>> " + data2.toString());    // data = {    //   'database': 'shahwan',    //   'login': 'admin',    //   'OdooApi': 'sgsdsfdgfdbrberb',    //   'date': "2021/11/3",    //   'qrcode_sale_form_line_ids': '[{"default_code":"0001013073","product_uom_qty":10},{"default_code":"0001013075","product_uom_qty":4}]',    // };    // print("data 1111 >>>> " + jsonEncode(data).toString());    // print("data 2222  >>>> " + jsonEncode(data).toString());    // print("data 33333  >>>> " + data.toString());    print("data 44444  >>>> " + data2.toString());    data = await Service("qrcode_receive").Post(data2);    print("result" + data.toString());    //{'message': 'Qrcode Sale Created', 'result': 'success', 'Reference': 450, 'new_qrcode_sale_id': '235'}    if (data['result'] == 'success') {      Alert(        context: context,        style: alertStyle,        title: "${AppController.strings.Success} ",        desc: "  ${AppController.strings.ref} = ${data['Reference']}",        image: Image(            height: 60,            width: 60,            image: AssetImage("asset/images/success-icon-23187.png")),        buttons: [          DialogButton(            child: Text(              "${AppController.strings.Done}",              style: TextStyle(color: Colors.white, fontSize: 20),            ),            onPressed: () => {Navigator.pop(context),            db.delet()},            color: ShahwanColor,            radius: BorderRadius.circular(20.0),          ),        ],      ).show();    } else {      Alert(        context: context,        style: alertStyle,        title: "${AppController.strings.FauilSend}",        desc: "${AppController.strings.TryCheck} ",        image: Image(            height: 60,            width: 60,            image: AssetImage("asset/images/PngItem_6273493.png")),        buttons: [          DialogButton(            child: Text(              "${AppController.strings.Done}",              style: TextStyle(color: Colors.white, fontSize: 20),            ),            onPressed: () => Navigator.pop(context),            color: ShahwanColor,            radius: BorderRadius.circular(20.0),          ),        ],      ).show();    }  }  @override  void initState() {    super.initState();    db = DatabaseHelper();  }  @override  Widget build(BuildContext context) {    return Scaffold(      appBar: AppBar(        centerTitle: true,        backgroundColor: ShahwanColor,        titleSpacing: 20,        title: Text(" ${AppController.strings.Sales} "),        leading: new IconButton(            icon: new Icon(Icons.arrow_back_ios_outlined),            onPressed: () => Navigator.of(context).pushReplacement(                MaterialPageRoute(builder: (context) => HomePage()))),      ),      body: FutureBuilder(        future: db.getAllProducts(),        builder: (context, AsyncSnapshot snapshot) {          if (!snapshot.hasData) {            return Center(              child: CircularProgressIndicator(),            );          } else {            return ListView.builder(                shrinkWrap: true,                physics: ScrollPhysics(),                itemCount: snapshot.data.length,                itemBuilder: (context, index) {                  ProductTabel product =                      ProductTabel.fromMap(snapshot.data[index]);                  return   Dismissible(                      key:  UniqueKey(),                      // only allows the user swipe from right to left                      direction: DismissDirection.startToEnd,                      // Remove this product from the list                      // In production enviroment, you may want to send some request to delete it on server side                      onDismissed: (_){                        index =index+1;                        db.deleteProduct(index);                         snapshot.data.removeAt(index-1);                        setState(() {                          db.delefromInventory(index);                          var delet =  db.delefromInventory(index+1);                          print (" db.delefromInventory(index);" + delet.toString());                          var deletList =  snapshot.data.removeAt(index-1);                          print (" db.delefromInventory(index);" + deletList.toString());                        });                      },                    child:Container(                      width: MediaQuery.of(context).size.width,                      height: 100,                      child: Padding(                        padding:                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),                        child: Ink(                            color: Colors.grey[100],                            child: ListTile(                                title: Row(                                  crossAxisAlignment: CrossAxisAlignment.center,                                  mainAxisAlignment: MainAxisAlignment.center,                                  children: [                                    Padding(                                      padding: const EdgeInsets.all(5.0),                                      child: Center(                                          child: Row(                                        children: [                                          SizedBox(                                            height: 20,                                            width: MediaQuery.of(context)                                                    .size                                                    .width /                                                5,                                            child: FittedBox(                                              fit: BoxFit.fitWidth,                                              child: Text(                                                product.name,                                                textAlign: TextAlign.justify,                                                style: TextStyle(                                                    color: Colors.black,                                                    fontStyle:                                                        FontStyle.normal),                                              ),                                            ),                                          ),                                          SizedBox(                                            width: 15,                                          ),                                          SizedBox(                                            height: 20,                                            width: MediaQuery.of(context)                                                    .size                                                    .width /                                                5,                                            child: FittedBox(                                              fit: BoxFit.fitWidth,                                              child: Text(                                                product.defaultCode,                                                textAlign: TextAlign.justify,                                                style: TextStyle(                                                    color: Colors.black,                                                    fontStyle:                                                        FontStyle.normal),                                              ),                                            ),                                          ),                                          SizedBox(                                            width: 15,                                          ),                                          SizedBox(                                            height: 15,                                            width: MediaQuery.of(context)                                                    .size                                                    .width /                                                12,                                            child: FittedBox(                                              fit: BoxFit.contain,                                              child: Text(                                                product.productUomQty                                                    .toString()!= null ? "${product.productUomQty}":"0",                                                textAlign: TextAlign.justify,                                                style: TextStyle(                                                    color: Colors.red,                                                    fontStyle:                                                        FontStyle.normal),                                              ),                                            ),                                          ),                                        ],                                      )),                                    )                                  ],                                ),                                trailing: IconButton(                                  icon: Icon(                                    Icons.edit_outlined,                                  ),                                  onPressed: () async {                                    showDialog(                                        context: context,                                        builder: (context) {                                          return Padding(                                            padding: const EdgeInsets.all(5.0),                                            child: AlertDialog(                                              elevation: 20,                                              scrollable: true,                                              actionsAlignment:                                                  MainAxisAlignment.center,                                              clipBehavior: Clip.hardEdge,                                              title: Text(' ${AppController.strings.AddQ}'),                                              content: TextField(                                                keyboardType:                                                    TextInputType.number,                                                inputFormatters: <                                                    TextInputFormatter>[                                                  FilteringTextInputFormatter                                                      .allow(RegExp(r'[0-9]')),                                                ],                                                onChanged: (value) {                                                  setState(() {                                                    // valueText = value;                                                  });                                                },                                                controller:                                                    _textFieldController,                                                decoration: InputDecoration(                                                    hintText: "${AppController.strings.QUantity}"),                                              ),                                              actions: <Widget>[                                                Padding(padding: EdgeInsets                                                    .all(10) ,                                                child:Center(                                                  child: Container(                                                    height: 30,                                                    width: 100,                                                    decoration: BoxDecoration(                                                        color: Colors.white,                                                        borderRadius:                                                        BorderRadius                                                            .circular(30)),                                                    child: FlatButton(                                                      color: ShahwanColor,                                                      textColor: Colors.white,                                                      child: Text('${AppController.strings.Add}'),                                                      onPressed: () async {                                                        int qu ;                                                        qu =int.parse(_textFieldController.text)                                                        ;                                                        // if (qu == ) {                                                        //   qu =0;                                                        // }                                                        var id = index;                                                        db.updateCourse(                                                            ProductTabel(                                                                product.id,                                                                product.name,                                                                product                                                                    .defaultCode,                                                                qu.toInt()));                                                        setState(() {                                                          _textFieldController                                                              .text = " ";                                                          Navigator.pop(                                                              context);                                                        });                                                      },                                                    ),                                                  ),                                                ),                                                )                                              ],                                            ),                                          );                                        });                                  },                                ))),                      )));                });          }        },      ),      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,      floatingActionButton: Padding(        padding: const EdgeInsets.all(15.0),        child: Align(          alignment: Alignment.bottomCenter,          child: Container(            padding: EdgeInsets.only(top: 400, bottom: 10),            child: Row(              crossAxisAlignment: CrossAxisAlignment.center,              mainAxisAlignment: MainAxisAlignment.center,              children: <Widget>[                SizedBox(                  height: 1,                ),                FloatingActionButton.extended(                  backgroundColor: ShahwanColor,                  onPressed: () {                    _send();                    // calling a function when user click on button                  },                  icon: Icon(Icons.send_outlined),                  label: Text("${AppController.strings.Sendd}"),                  heroTag: Text("${AppController.strings.Sendd}"),                ),                SizedBox(                  width: 20,                ),              new  FloatingActionButton.extended(                  backgroundColor: ShahwanColor,                  onPressed: () {                    _scanQR();                    // calling a function when user click on button                  },                  icon: Icon(Icons.camera_alt_outlined),                  label: Text("${AppController.strings.Scan}"),                  heroTag: Text("${AppController.strings.Scan}"),                ),              ],            ),          ),        ),      ),      // floatingActionButton: FloatingActionButton.extended(      //     icon: Icon(Icons.camera_alt),      //     onPressed: () {      //       _scanQR();      //      //       // calling a function when user click on button      //     },      //     label: Text("Scan")),      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,    );  }}