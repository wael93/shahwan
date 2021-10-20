import 'dart:math';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter/services.dart';
import 'package:shahwan/Services/service.dart';
import 'package:shahwan/Model/ProductTabel.dart';
import 'package:shahwan/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'Database/sqlLite.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Homepage.dart';

class QRViewExample extends StatefulWidget {
  @override
  _QRViewExampleState createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  // String result = "Hello Worlderer..!";
  // String Name = "Hello Worlderer..!";
  var DataTabel1;

  final _textFieldController = TextEditingController(text: "0");

  var alertStyle = AlertStyle(
      alertPadding: EdgeInsets.only(top: 150, bottom: 150),
      animationType: AnimationType.shrink,
      isCloseButton: true,
      isOverlayTapDismiss: true,
      descStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: 10),
      animationDuration: Duration(milliseconds: 100),
      alertBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
        side: BorderSide(
          color: Colors.grey,
        ),
      ),
      titleStyle: TextStyle(
        color: Colors.red,
      ),
      constraints: BoxConstraints.expand(width: 300),
      //First to chars "55" represents transparency of color
      overlayColor: Color(0x55000000),
      alertElevation: 10,
      alertAlignment: Alignment.center);

  DatabaseHelper db = DatabaseHelper();

  Future _scanQR() async {
    try {
      String? cameraScanResult = await scanner.scan();
      // print("cameraScanResult" + cameraScanResult.toString());
      var cameraScanResultNumber = cameraScanResult
          .toString()
          .substring(0, cameraScanResult.toString().indexOf('|'));
      var cameraScanResultName = cameraScanResult.toString().substring(
          cameraScanResult.toString().indexOf('|\$\$|') + 4,
          cameraScanResult.toString().indexOf('-'));
      // var  code = cameraScanResult.toString().split(' ');
      // print("cameraScanResult>>>>>>>>" + cameraScanResultNumber.toString());
      // print("cameraScanResultName >>>>>>" + cameraScanResultName.toString());

      var name = cameraScanResultName;
      String defaultCode = cameraScanResultNumber.toString();

      var productUomQty = '0'.toString();
      db.SaveProduct(new ProductTabel(null,
          name.toString(), defaultCode, productUomQty));
      // db.updateCourse(ProductTabel(3,
      //     name.toString(), defaultCode.toString(), "2"));

      // var data = {
      //   'database': 'shahwan',
      //   'login': 'admin',
      //   'OdooApi': 'sgsdsfdgfdbrberb',
      //   'date': formattedDate,
      //   'qrcode_sale_form_line_ids': DataTabel1.toString(),
      // };
      // print("data" + data.toString());
      // var result1 = await Service("qrcode_receive").Post(data);
      // print("result" + result1.toString());
      setState(() {
        // result = cameraScanResultNumber.toString();
        // Name = cameraScanResultName.toString();
        // setting string
        // result with
        // cameraScanResult
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future _send() async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd-MM-yyyy').format(now);
    var all = await db.getAllProducts();
    print("ALL>>>>" + all.toString());
    final prefs = await SharedPreferences.getInstance();
    final shahwan = prefs.getString('shahwan');
    final login = prefs.getString('UserName');
    final OdooApi = prefs.getString('OdooApi');
    List update = await db.get2Produc();
    print("UPDATE" + update.toString());


    var data;
    data = {
      'database':"shahwan",
      'login':"admin",
      'OdooApi':"sgsdsfdgfdbrberb",
      'date':formattedDate,
      'qrcode_sale_form_line_ids':'[{"default_code":"000008362016","product_uom_qty":10},{"default_code":"0001013075","product_uom_qty":11}]',

    };
    print("data >>>> " + data.toString());
    data = await Service("qrcode_receive").Post(data);
    print("result" + data.toString());
    //{'message': 'Qrcode Sale Created', 'result': 'success', 'Reference': 450, 'new_qrcode_sale_id': '235'}
    if (data['result'] == 'success') {
      Alert(
        context: context,
        style: alertStyle,
        title: "تمت العملية بنجاح ",
        desc: "  الرقم المرجعي = ${data['Reference']}",
        image: Image(
            height: 60,
            width: 60,
            image: AssetImage("asset/images/success-icon-23187.png")),
        buttons: [
          DialogButton(
            child: Text(
              "تم",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: ShahwanColor,
            radius: BorderRadius.circular(20.0),
          ),
        ],
      ).show();
    } else {
      Alert(
        context: context,
        style: alertStyle,
        title: "حدث خطاء في الارسال",
        desc: "  حاول التاكد من المدخلات",
        image: Image(
            height: 60,
            width: 60,
            image: AssetImage("asset/images/PngItem_6273493.png")),
        buttons: [
          DialogButton(
            child: Text(
              "تم",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            color: ShahwanColor,
            radius: BorderRadius.circular(20.0),
          ),
        ],
      ).show();
    }
    var delet = await db.delet();
    print("delet" + delet.toString());
  }

  @override
  void initState() {
    super.initState();
    db = DatabaseHelper();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ShahwanColor,
        titleSpacing: 20,
        title: Text(" المواصفات والكميات "),
        leading: new IconButton(
            icon: new Icon(Icons.arrow_back_ios_outlined),
            onPressed: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomePage()))),
      ),
      body: FutureBuilder(
        future: db.getAllProducts(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                shrinkWrap: true,
                physics: ScrollPhysics(),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  ProductTabel product =
                      ProductTabel.fromMap(snapshot.data[index]);
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Ink(
                            color: Colors.grey[100],
                            child: ListTile(
                                title: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Center(
                                          child: Row(
                                        children: [
                                          SizedBox(
                                            height: 20,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                5,
                                            child: FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: Text(
                                                product.name,
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontStyle:
                                                        FontStyle.normal),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          SizedBox(
                                            height: 20,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                5,
                                            child: FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child: Text(
                                                product.defaultCode,
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontStyle:
                                                        FontStyle.normal),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          SizedBox(
                                            height: 15,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                12,
                                            child: FittedBox(
                                              fit: BoxFit.contain,
                                              child: Text(
                                                product.productUomQty,
                                                textAlign: TextAlign.justify,
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontStyle:
                                                        FontStyle.normal),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                    )
                                  ],
                                ),
                                trailing: IconButton(
                                  icon: Icon(
                                    Icons.edit_outlined,
                                    size: 15,
                                  ),
                                  onPressed: () async {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: AlertDialog(
                                              elevation: 20,
                                              scrollable: true,
                                              clipBehavior:Clip.hardEdge ,
                                              title: Text('إضافة كمية'),
                                              content: TextField(

                                                  keyboardType: TextInputType.number,
                                                  inputFormatters: <TextInputFormatter>[
                                                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                                  ],

                                                onChanged: (value) {
                                                  setState(() {
                                                     // valueText = value;
                                                  });
                                                },
                                                controller: _textFieldController,
                                                decoration: InputDecoration(hintText: "الكمية"),
                                              ),
                                              actions: <Widget>[
                                                Center(
                                              child: Container(
                                              height: 10,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(20)),
                                                    child: FlatButton(
                                                      color:ShahwanColor,
                                                      textColor: Colors.white,
                                                      child: Text('إضافة'),
                                                      onPressed: () async{
                                                        var qu = " ";
                                                         qu = _textFieldController.text;
                                                        if(qu==" "){ qu="0";}
                                                       var id=index;
                                                        db.updateCourse(ProductTabel(product.id,product.name, product.defaultCode, qu));


                                                        setState(() {
                                                          _textFieldController.text=" ";
                                                          Navigator.pop(context);
                                                        });
                                                      },
                                                    ),

                                                )


                                                )],
                                            ),
                                          );
                                        });

                                  },
                                ))),
                      ));
                });
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.only(top: 400, bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 1,
                ),
                FloatingActionButton.extended(
                  backgroundColor: ShahwanColor,
                  onPressed: () {
                    _send();

                    // calling a function when user click on button
                  },
                  icon: Icon(Icons.send_outlined),
                  label: Text("حفظ"),
                ),
                SizedBox(
                  width: 20,
                ),
                FloatingActionButton.extended(
                  backgroundColor: ShahwanColor,
                  onPressed: () {
                    _scanQR();

                    // calling a function when user click on button
                  },
                  icon: Icon(Icons.camera_alt_outlined),
                  label: Text("مسح"),
                ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //     icon: Icon(Icons.camera_alt),
      //     onPressed: () {
      //       _scanQR();
      //
      //       // calling a function when user click on button
      //     },
      //     label: Text("Scan")),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class _changeDealogState extends State {
  TextEditingController PhoneController = TextEditingController();

  TextEditingController userNameController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();

  @override
  void initState() {
    // userNameController.value= TextEditingValue(text: "${widget.username}");
    // addressController.value= TextEditingValue(text: "${widget.address}");
    // PhoneController.value= TextEditingValue(text: "${widget.phone}");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Change data'),
      content: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              controller: userNameController,
              textAlign: TextAlign.center,
              // controller: PhoneController.text=widget.phone,

              onChanged: (value) {},
              // decoration: KDecoration.copyWith(
              //     filled: true,
              //     fillColor: Colors.white70,
              //     labelText: '${ApplicationManager().currentLanguage.EnterUserName}'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              autocorrect: false,
              controller: PhoneController,

              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              onChanged: (value) {},
              // decoration: KDecoration.copyWith(
              //     filled: true,
              //     fillColor: Colors.white70,
              //     labelText: '${ApplicationManager().currentLanguage.enterYourPhone}'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextFormField(
              autocorrect: false,

              controller: addressController,

              // controller:addressController.text= widget.address,
              textAlign: TextAlign.center,

              // decoration: KDecoration.copyWith(
              //     filled: true,
              //     fillColor: Colors.white70,
              //     labelText: '${ApplicationManager().currentLanguage.pleaseenteraddress}'),
            ),
          ),
        ],
      ),
      actions: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              // child:  button(
              // onpress: (){
              //   setState(() {
              //     Navigator.pop(context);
              //   });
              // },
              // color: Colors.black,buttonName: 'cancel',),
            ),

            // Padding(padding: EdgeInsets.all(10),child:
            // button(
            //   onpress: (){
            //     setState(() {
            //
            //       print(addressController.text);
            //       print(userNameController.text);
            //       print(PhoneController.text);
            //
            //       Provider.of<UserViewModel>(context,listen: false).sendeditSubUser(address: addressController.text,username: userNameController.text,phone: PhoneController.text,subId: widget.id.toString())
            //           .then((value) {
            //         setState(() {
            //           Provider.of<UserViewModel>(context,listen: false).getSubUser();
            //         });
            //       } ).then((value) {
            //
            //         showTopSnackBar(
            //           context,
            //           CustomSnackBar.success(
            //             message:
            //             "${ApplicationManager().currentLanguage.editsuccess}",
            //           ),
            //         );
            //         Navigator.pop(context);
            //       } );
            //     });
            //   },
            //   color: Colors.lightBlue,buttonName: 'save',))
          ],
        )
      ],
    );
  }
}
