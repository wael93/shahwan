import 'package:flutter/material.dart';import 'package:shahwan/AppController.dart';import 'package:shahwan/AppString.dart';import 'package:shahwan/login.dart';import 'package:flutter/material.dart';import 'package:flutter_localizations/flutter_localizations.dart';import 'package:shahwan/Homepage.dart';import 'package:shared_preferences/shared_preferences.dart';import 'package:shahwan/globals.dart' as globals;import 'package:localstorage/localstorage.dart';Future<void> main() async{  WidgetsFlutterBinding.ensureInitialized();  SharedPreferences prefs = await SharedPreferences.getInstance();  var lag = prefs.getString('OdooApi');  // String? lang =pref.getString("OdooApi")  print("LAng In main " + lag.toString());  // Future<void> main() async {  //   SharedPreferences prefs = await SharedPreferences.getInstance();  //   var email = prefs.getString('email');  //   print(email);  //   runApp(MaterialApp(home: email == null ? SignIn() : HomePage()));  // }  String? languageState;    SharedPreferences preferences = await SharedPreferences.getInstance();      languageState = preferences.getString("lng");      print("SHWERD PREF LANG " +languageState.toString() );      if(languageState=='Ar'){        AppController.strings = ArabicString();      }else if(languageState=='En') {        AppController.strings = EnglishString();      }  //  // @override  // void initState() {  //   langState();  //  //  // }  runApp(      MaterialApp(        title: 'Flutter Demo',        debugShowCheckedModeBanner: false,        localizationsDelegates: [          GlobalCupertinoLocalizations.delegate,          GlobalMaterialLocalizations.delegate,          GlobalWidgetsLocalizations.delegate,        ],        supportedLocales: [          Locale("ar", "JO"), // OR Locale('ar', 'AE') OR Other RTL locales        ],        locale: Locale("ar", "JO"), // OR Locale('ar', 'AE') OR Other RTL locales,        // theme: ThemeData(        //   // This is the theme of your application.        //   //        //   // Try running your application with "flutter run". You'll see the        //   // application has a blue toolbar. Then, without quitting the app, try        //   // changing the primarySwatch below to Colors.green and then invoke        //   // "hot reload" (press "r" in the console where you ran "flutter run",        //   // or simply save your changes to "hot reload" in a Flutter IDE).        //   // Notice that the counter didn't reset back to zero; the application        //   // is not restarted.        //   primarySwatch: Colors.blue,        // ),        home:Directionality(          textDirection: TextDirection.rtl,          child:lag == null? Login():HomePage() ,        ),        // builder: (context, child) {        //   return Directionality(        //     textDirection: TextDirection.rtl,        //     child:  Login(),        //   );        // },        // routes: <String, WidgetBuilder>{        //   '/HomePage': (BuildContext context) => new HomePage(),        // },      ));}// class MyApp extends StatelessWidget {//   var lag;////   // var pref;//   // // const MyApp({Key? key}) : super(key: key);//   // @override//   // void initState()async {//   ////   //   SharedPreferences prefs = await SharedPreferences.getInstance();//   //   pref = prefs.get("OdooApi")??"";//   // }//////   // This widget is the root of your application.//   @override//   Widget build(BuildContext context) {////////     return//   }//// }// class Splash extends StatefulWidget {//   @override//   SplashState createState() => new SplashState();// }////////// class SplashState extends State<Splash> {////////   Future checkFirstSeen() async {//////     if (lang != null) {//       Navigator.of(context).pushReplacement(//         // new MaterialPageRoute(builder: (context) => new HomeScreen()));//           new MaterialPageRoute(builder: (context) => new HomePage()));//     } else {//       // prefs.setBool('seen', true);//       Navigator.of(context).pushReplacement(//           new MaterialPageRoute(builder: (context) => new Login()));//     }//   }////   @override//   Widget build(BuildContext context) {//     // TODO: implement build//     throw UnimplementedError();//   }// }