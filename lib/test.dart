// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:redeeming_application/statics/staticValidate.dart';
// import 'package:redeeming_application/viewModels/UserViewModel.dart';
// import 'package:redeeming_application/views/widget/buttonClass.dart';
// import 'package:redeeming_application/views/widget/const.dart';
// import 'package:redeeming_application/views/widget/navigationFun.dart';
// import 'package:top_snackbar_flutter/custom_snack_bar.dart';
// import 'package:top_snackbar_flutter/top_snack_bar.dart';
//
// import 'application_manger.dart';
//
// class allSubOfusers extends StatefulWidget {
//   const allSubOfusers({Key? key}) : super(key: key);
//
//   @override
//   _allSubOfusersState createState() => _allSubOfusersState();
// }
//
// class _allSubOfusersState extends State<allSubOfusers> {
//
//   var SubUser;
//   @override
//   void initState() {
//     Provider.of<UserViewModel>(context,listen: false).getSubUser();
//     setState(() {
//
//     });
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     SubUser =Provider.of<UserViewModel>(context).subUser;
//
//     return Directionality(
//         textDirection: ApplicationManager().currentLanguage.textDirection,
//         child: Scaffold(
//           appBar: AppBar(
//             iconTheme: IconThemeData(color: Colors.black),
//             backgroundColor: Colors.grey[100],
//             centerTitle: true,
//             title: Text(
//               '${ApplicationManager().currentLanguage.SubUserInformation}',
//               style: TextStyle(color: Colors.black),
//             ),
//           ),
//           body: ListView.builder(
//
//             itemCount: SubUser.length,
//             itemBuilder: (context, index) {
//               return Container(
//                   height: 100,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                     child: Ink(
//                         color: Colors.grey[100],
//                         child: ListTile(
//                             title: Column(
//                               crossAxisAlignment: CrossAxisAlignment.center,
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//
//                                 Text(
//                                   '${SubUser[index].username}',
//                                   style: TextStyle(
//                                       fontSize: 15, color: Colors.green),
//                                 ),
//
//                                 Text(
//                                   'Phone : ${SubUser[index].phoneNo} ',
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//
//                                 Text(
//                                   'Address : ${SubUser[index].address}',
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//
//                               ],
//                             ),
//                             leading: Icon(FontAwesomeIcons.user),
//                             trailing: IconButton(
//                               icon: Icon(Icons.edit),
//                               onPressed: () {
//
//
//                                 showDialog(
//                                     context: context,
//                                     builder: (_) {
//                                       return changeDealog(username:SubUser[index].username ,address: SubUser[index].address,phone:SubUser[index].phoneNo ,id:SubUser[index].id ,);
//                                     });
//                               },
//                             ))),
//                   ));
//             },
//           ),
//         ));
//     // return   ListView.builder(
//     //   itemCount: SupUser.length,
//     //   itemBuilder: (BuildContext context, int index) {
//     //     return Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),child: Ink(
//     //         color: Colors.grey[100],
//     //         child: ListTile(
//     //           title: Text('${SupUser[index].title}',style: TextStyle(fontSize: 18),),
//     //           subtitle:Row(children: [
//     //             Text('${SupUser[index].firstName} ',style: TextStyle(fontSize: 15),),
//     //             Text('${SupUser[index].lastName}',style: TextStyle(fontSize: 15),),
//     //           ],),
//     //           trailing: Text('${SupUser[index].date}',style: TextStyle(fontSize: 18,color: Colors.green),),
//     //           leading: CircleAvatar(
//     //             maxRadius: 20,
//     //             backgroundColor: Color(0xff891812),
//     //             child: ClipOval(
//     //                 child: Image.network('${transa[index].image}'
//     //                 )),),
//     //         )),);
//     //   },
//     // ),
//   }
// }
//
// class changeDealog extends StatefulWidget {
//   final username;
//   final phone;
//   final address;
//   final id;
//   changeDealog({this.address,this.username,this.phone,this.id});
//   @override
//   _changeDealogState createState() => _changeDealogState();
// }
//
//
// class _changeDealogState extends State<changeDealog> {
//   TextEditingController  PhoneController = TextEditingController();
//
//   TextEditingController userNameController = new TextEditingController();
//   TextEditingController addressController = new TextEditingController();
//   @override
//   void initState() {
//     userNameController.value= TextEditingValue(text: "${widget.username}");
//     addressController.value= TextEditingValue(text: "${widget.address}");
//     PhoneController.value= TextEditingValue(text: "${widget.phone}");
//     super.initState();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text('Change data'),
//       content: ListView(
//         children: [
//           Padding(
//             padding: EdgeInsets.all(10),
//             child: TextFormField(
//
//               validator: staticWidget().namevalid,
//               controller:userNameController,
//               textAlign: TextAlign.center,
//               // controller: PhoneController.text=widget.phone,
//
//               onChanged: (value) {
//               },
//               decoration: KDecoration.copyWith(
//                   filled: true,
//                   fillColor: Colors.white70,
//                   labelText: '${ApplicationManager().currentLanguage.EnterUserName}'),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(10),
//             child: TextFormField(
//               autocorrect: false,
//               validator: staticWidget().phoneValid,
//               controller:PhoneController,
//
//               textAlign: TextAlign.center,
//               keyboardType: TextInputType.number,
//               onChanged: (value) {
//
//               },
//               decoration: KDecoration.copyWith(
//                   filled: true,
//                   fillColor: Colors.white70,
//                   labelText: '${ApplicationManager().currentLanguage.enterYourPhone}'),
//             ),
//           ),
//           Padding(
//             padding: EdgeInsets.all(10),
//             child: TextFormField(
//               autocorrect: false,
//               validator: staticWidget().emailvalid,
//               controller:addressController,
//
//               // controller:addressController.text= widget.address,
//               textAlign: TextAlign.center,
//
//               decoration: KDecoration.copyWith(
//                   filled: true,
//                   fillColor: Colors.white70,
//                   labelText: '${ApplicationManager().currentLanguage.pleaseenteraddress}'),
//             ),
//           ),
//         ],),
//       actions: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Padding(padding: EdgeInsets.all(10),child:  button(
//               onpress: (){
//                 setState(() {
//                   Navigator.pop(context);
//                 });
//               },
//               color: Colors.black,buttonName: 'cancel',),),
//
//             Padding(padding: EdgeInsets.all(10),child:
//             button(
//               onpress: (){
//                 setState(() {
//
//                   print(addressController.text);
//                   print(userNameController.text);
//                   print(PhoneController.text);
//
//                   Provider.of<UserViewModel>(context,listen: false).sendeditSubUser(address: addressController.text,username: userNameController.text,phone: PhoneController.text,subId: widget.id.toString())
//                       .then((value) {
//                     setState(() {
//                       Provider.of<UserViewModel>(context,listen: false).getSubUser();
//                     });
//                   } ).then((value) {
//
//                     showTopSnackBar(
//                       context,
//                       CustomSnackBar.success(
//                         message:
//                         "${ApplicationManager().currentLanguage.editsuccess}",
//                       ),
//                     );
//                     Navigator.pop(context);
//                   } );
//                 });
//               },
//               color: Colors.lightBlue,buttonName: 'save',))
//           ],
//         )
//       ],
//     );
//   }
// }
