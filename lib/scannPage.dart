////// import 'package:flutter/material.dart';// import 'package:qrscan/qrscan.dart' as scanner;// import 'package:flutter/services.dart';// import 'package:shahwan/Services/service.dart';//// class Scanne extends StatefulWidget {//   @override//   _ScanneState createState() => _ScanneState();// }// class _ScanneState extends State<Scanne> {//   String result = "Hello Worlderer..!";//   Future _scanQR() async {//     try {//       String? cameraScanResult = await scanner.scan();//       print("cameraScanResult" + cameraScanResult.toString());//       cameraScanResult= cameraScanResult.toString().substring(0, cameraScanResult.toString().indexOf('|'));//       // var  code = cameraScanResult.toString().split(' ');//        print("cameraScanResult" + cameraScanResult.toString());//       var data = {//         'database': 'shahwan',//         'login': 'admin',//         'OdooApi': 'sgsdsfdgfdbrberb',//         'default_code': '${cameraScanResult}',//       };//       var result1 = await  Service("view_product").Post(data);//       print("result" + result1.toString());//       setState(() {//         result = cameraScanResult.toString(); // setting string result with//         // cameraScanResult//       });//     } on PlatformException catch (e) {//       print(e);//     }//   }//   @override//   Widget build(BuildContext context) {//     return Scaffold(//       appBar: AppBar(//         title: Text("QR Scanner Example In Flutter"),//       ),//       body: Center(//         child:Column(//           children: [//             Container(////             ),//             Text(result.toString()),//           ],////         )  // Here the scanned result will//     // be shown//       ),//       floatingActionButton: FloatingActionButton.extended(//           icon: Icon(Icons.camera_alt),//           onPressed: () {//             _scanQR(); // calling a function when user click on button//           },//           label: Text("Scan")),//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,//     );//   }// }