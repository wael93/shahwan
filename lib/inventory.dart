import 'dart:convert';import 'dart:math';import 'package:intl/intl.dart';import 'package:flutter/material.dart';import 'package:qrscan/qrscan.dart' as scanner;import 'package:flutter/services.dart';import 'package:shahwan/Services/service.dart';import 'package:shahwan/Model/ProductTabel.dart';import 'package:shahwan/constants.dart';import 'package:shared_preferences/shared_preferences.dart';import 'package:flutter/cupertino.dart';import 'package:rflutter_alert/rflutter_alert.dart';import 'Database/sqlLite.dart';import 'package:font_awesome_flutter/font_awesome_flutter.dart';import 'Homepage.dart';class Inventory extends StatefulWidget {  @override  _InventoryState createState() => _InventoryState();}class _InventoryState extends State<Inventory> {  // String result = "Hello Worlderer..!";  // String Name = "Hello Worlderer..!";  var DataTabel1;  final  TextEditingController  _userNamelController = TextEditingController();  final _textFieldController = TextEditingController(text: " ");  var alertStyle = AlertStyle(      alertPadding: EdgeInsets.only(top: 150, bottom: 150),      animationType: AnimationType.shrink,      isCloseButton: true,      isOverlayTapDismiss: true,      descStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 10),      animationDuration: Duration(milliseconds: 100),      alertBorder: RoundedRectangleBorder(        borderRadius: BorderRadius.circular(20.0),        side: BorderSide(          color: Colors.grey,        ),      ),      titleStyle: TextStyle(        color: Colors.red,      ),      constraints: BoxConstraints.expand(width: 300),      //First to chars "55" represents transparency of color      overlayColor: Color(0x55000000),      alertElevation: 10,      alertAlignment: Alignment.center);  DatabaseHelper db = DatabaseHelper();  Future _scanQR() async {    try {      String? cameraScanResult = await scanner.scan();      // print("cameraScanResult" + cameraScanResult.toString());      var cameraScanResultNumber = cameraScanResult          .toString()          .substring(0, cameraScanResult.toString().indexOf('|'));      var cameraScanResultName = cameraScanResult.toString().substring(          cameraScanResult.toString().indexOf('|\$\$|') + 4,          cameraScanResult.toString().indexOf('-'));      var name = cameraScanResultName;      String defaultCode = cameraScanResultNumber.toString();      int productUomQty = 0;      db.InventorySaveProduct( ProductTabel(null, name.toString(), defaultCode, productUomQty.toInt()));      setState(() {        // result = cameraScanResultNumber.toString();        // Name = cameraScanResultName.toString();        // setting string        // result with        // cameraScanResult      });    } on PlatformException catch (e) {      print(e);    }  }  Future _send() async {    // List printJson(String input) {    //   const JsonDecoder decoder = JsonDecoder();    //   const JsonEncoder encoder = JsonEncoder.withIndent('  ');    //   final dynamic object = decoder.convert(input);    //   final dynamic prettyString = encoder.convert(object);    //   return prettyString.split('\n').forEach((dynamic element) => print    //     (element));    // }    DateTime now = DateTime.now();    String formattedDate = DateFormat('yyyy/MM/dd').format(now);    var all = await db.getAllProducts();    print("ALL>>>>" + all.toString());    final prefs = await SharedPreferences.getInstance();    final shahwan = prefs.getString('shahwan');    final login = prefs.getString('UserName');    final OdooApi = prefs.getString('OdooApi');    final String ref =_userNamelController.text ;    List update = await db.Inventoryget2Produc();    // print("jsonEncode(body) " + jsonEncode(update) );    var json = jsonEncode(update);    var data;    var data2 = {      'database': "shahwan",      'login': "admin",      'OdooApi': "sgsdsfdgfdbrberb",      'qr_ref':ref.toString(),      'date': formattedDate,      'qrcode_inventory_line_ids': json.toString(),    };    data = {      'database': 'shahwan',      'login': 'admin',      'OdooApi': 'sgsdsfdgfdbrberb',      'qr_ref':ref.toString(),      'date': "2021/11/3",      'qrcode_inventory_line_ids': '[{"default_code":"0001013073","product_uom_qty":10},{"default_code":"0001013075","product_uom_qty":4}]',    };    // print("data 1111 >>>> " + jsonEncode(data).toString());    // print("data 2222  >>>> " + jsonEncode(data).toString());    print("data 33333  >>>> " + data.toString());    print("data 44444  >>>> " + data2.toString());    data = await Service("qrcode_inventory").Post(data2);    print("result" + data.toString());    //{'message': 'Qrcode Sale Created', 'result': 'success', 'Reference': 450, 'new_qrcode_sale_id': '235'}    if (data['result'] == 'success') {      Alert(        context: context,        style: alertStyle,        title: "تمت العملية بنجاح ",        desc: "  الرقم المرجعي = ${data['Reference']}",        image: Image(            height: 60,            width: 60,            image: AssetImage("asset/images/success-icon-23187.png")),        buttons: [          DialogButton(            child: Text(              "تم",              style: TextStyle(color: Colors.white, fontSize: 20),            ),            onPressed: () => {Navigator.pop(context),            db.inventorydelet()            },            color: ShahwanColor,            radius: BorderRadius.circular(20.0),          ),        ],      ).show();    } else {      Alert(        context: context,        style: alertStyle,        title: "حدث خطاء في الارسال",        desc: "  حاول التاكد من المدخلات",        image: Image(            height: 60,            width: 60,            image: AssetImage("asset/images/PngItem_6273493.png")),        buttons: [          DialogButton(            child: Text(              "تم",              style: TextStyle(color: Colors.white, fontSize: 20),            ),            onPressed: () => Navigator.pop(context),            color: ShahwanColor,            radius: BorderRadius.circular(20.0),          ),        ],      ).show();    }    var delet = await db.delet();    print("delet" + delet.toString());  }  @override  void initState() {    super.initState();    db = DatabaseHelper();  }  @override  Widget build(BuildContext context) {    return Scaffold(      appBar: AppBar(        centerTitle: true,        backgroundColor: ShahwanColor,        titleSpacing: 20,        title: Text(" الجرد "),        leading: new IconButton(            icon: new Icon(Icons.arrow_back_ios_outlined),            onPressed: () => Navigator.of(context).pushReplacement(                MaterialPageRoute(builder: (context) => HomePage()))),      ),      body: Column(          mainAxisSize: MainAxisSize.max,          children: <Widget>[   SizedBox(          height: 80,         child: Padding(            padding: EdgeInsets.all(10),            child: TextFormField(              controller: _userNamelController,              cursorColor: Colors.black12,              textAlign: TextAlign.center,              decoration: InputDecoration(                  border: OutlineInputBorder(),                  labelText: "الكود المرجعي",                  labelStyle: TextStyle( color: Colors.black45 ,),                  hintText: 'ادخل الكود'),              // validator: MultiValidator([              //   RequiredValidator(errorText: "* مطلوب"),              //   EmailValidator(errorText: "ادخل اسم مستخدم صالح "),              // ])            ),          ),        ),          Expanded(child: FutureBuilder(            future: db.InventorygetAllProducts(),            builder: (context, AsyncSnapshot snapshot) {              if (!snapshot.hasData) {                return Center(                  child: CircularProgressIndicator(),                );              } else {                return ListView.builder(                    shrinkWrap: true,                    physics: ScrollPhysics(),                    itemCount: snapshot.data.length,                    itemBuilder: (context, index) {                      ProductTabel product =                      ProductTabel.fromMap(snapshot.data[index]);                      return Container(                          width: MediaQuery.of(context).size.width,                          height: 100,                          child: Padding(                            padding:                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),                            child: Ink(                                color: Colors.grey[100],                                child: ListTile(                                    title: Row(                                      crossAxisAlignment: CrossAxisAlignment.center,                                      mainAxisAlignment: MainAxisAlignment.center,                                      children: [                                        Padding(                                          padding: const EdgeInsets.all(5.0),                                          child: Center(                                              child: Row(                                                children: [                                                  SizedBox(                                                    height: 20,                                                    width: MediaQuery.of(context)                                                        .size                                                        .width /                                                        5,                                                    child: FittedBox(                                                      fit: BoxFit.fitWidth,                                                      child: Text(                                                        product.name,                                                        textAlign: TextAlign.justify,                                                        style: TextStyle(                                                            color: Colors.black,                                                            fontStyle:                                                            FontStyle.normal),                                                      ),                                                    ),                                                  ),                                                  SizedBox(                                                    width: 15,                                                  ),                                                  // SizedBox(                                                  //   height: 20,                                                  //   width: MediaQuery.of(context)                                                  //       .size                                                  //       .width /                                                  //       5,                                                  //   child: FittedBox(                                                  //     fit: BoxFit.fitWidth,                                                  //     child: Text(                                                  //       product.defaultCode,                                                  //       textAlign: TextAlign.justify,                                                  //       style: TextStyle(                                                  //           color: Colors.black,                                                  //           fontStyle:                                                  //           FontStyle.normal),                                                  //     ),                                                  //   ),                                                  // ),                                                  SizedBox(                                                    width: 15,                                                  ),                                                  SizedBox(                                                    height: 15,                                                    width: MediaQuery.of(context)                                                        .size                                                        .width /                                                        12,                                                    child: FittedBox(                                                      fit: BoxFit.contain,                                                      child: Text(                                                        product.productUomQty                                                            .toString()!= null ? "${product.productUomQty}":"0",                                                        textAlign: TextAlign.justify,                                                        style: TextStyle(                                                            color: Colors.red,                                                            fontStyle:                                                            FontStyle.normal),                                                      ),                                                    ),                                                  ),                                                ],                                              )),                                        )                                      ],                                    ),                                    trailing: IconButton(                                      icon: Icon(                                        Icons.edit_outlined,                                      ),                                      onPressed: () async {                                        showDialog(                                            context: context,                                            builder: (context) {                                              return Padding(                                                padding: const EdgeInsets.all(5.0),                                                child: AlertDialog(                                                  elevation: 20,                                                  scrollable: true,                                                  actionsAlignment:                                                  MainAxisAlignment.center,                                                  clipBehavior: Clip.hardEdge,                                                  title: Text('إضافة كمية'),                                                  content: TextField(                                                    keyboardType:                                                    TextInputType.number,                                                    inputFormatters: <                                                        TextInputFormatter>[                                                      FilteringTextInputFormatter                                                          .allow(RegExp(r'[0-9]')),                                                    ],                                                    onChanged: (value) {                                                      setState(() {                                                        // valueText = value;                                                      });                                                    },                                                    controller:                                                    _textFieldController,                                                    decoration: InputDecoration(                                                        hintText: "الكمية"),                                                  ),                                                  actions: <Widget>[                                                    Padding(padding: EdgeInsets                                                        .all(10) ,                                                      child:Center(                                                        child: Container(                                                          height: 30,                                                          width: 100,                                                          decoration: BoxDecoration(                                                              color: Colors.white,                                                              borderRadius:                                                              BorderRadius                                                                  .circular(30)),                                                          child: FlatButton(                                                            color: ShahwanColor,                                                            textColor: Colors.white,                                                            child: Text('إضافة'),                                                            onPressed: () async {                                                              int qu ;                                                              qu =int.parse(_textFieldController.text)                                                              ;                                                              // if (qu == ) {                                                              //   qu =0;                                                              // }                                                              var id = index;                                                              db.InventoreupdateCourse(                                                                  ProductTabel(                                                                      product.id,                                                                      product.name,                                                                      product                                                                          .defaultCode,                                                                      qu.toInt()));                                                              setState(() {                                                                _textFieldController                                                                    .text = " ";                                                                Navigator.pop(                                                                    context);                                                              });                                                            },                                                          ),                                                        ),                                                      ),                                                    )                                                  ],                                                ),                                              );                                            });                                      },                                    ))),                          ));                    });              }            },          ), ),          ]      ),      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,      floatingActionButton: Padding(        padding: const EdgeInsets.all(15.0),        child: Align(          alignment: Alignment.bottomCenter,          child: Container(            padding: EdgeInsets.only(top: 400, bottom: 10),            child: Row(              crossAxisAlignment: CrossAxisAlignment.center,              mainAxisAlignment: MainAxisAlignment.center,              children: <Widget>[                SizedBox(                  height: 1,                ),                FloatingActionButton.extended(                  backgroundColor: ShahwanColor,                  onPressed: () {                    _send();                    // calling a function when user click on button                  },                  icon: Icon(Icons.send_outlined),                  label: Text("حفظ"),                ),                SizedBox(                  width: 20,                ),                FloatingActionButton.extended(                  backgroundColor: ShahwanColor,                  onPressed: () {                    _scanQR();                    // calling a function when user click on button                  },                  icon: Icon(Icons.camera_alt_outlined),                  label: Text("مسح"),                ),              ],            ),          ),        ),      ),      // floatingActionButton: FloatingActionButton.extended(      //     icon: Icon(Icons.camera_alt),      //     onPressed: () {      //       _scanQR();      //      //       // calling a function when user click on button      //     },      //     label: Text("Scan")),      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,    );  }}