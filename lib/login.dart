import 'dart:ui';import 'package:flutter/material.dart';import 'package:form_field_validator/form_field_validator.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:shahwan/AppController.dart';import 'package:shahwan/AppSharedPrefs.dart';import 'package:shahwan/AppString.dart';import 'package:shahwan/Homepage.dart';import 'package:shahwan/constants.dart';import 'package:shared_preferences/shared_preferences.dart';import 'Services/service.dart';import 'package:shahwan/globals.dart' as globals;import 'package:snack/snack.dart';import 'package:top_snackbar_flutter/top_snack_bar.dart';import 'package:top_snackbar_flutter/custom_snack_bar.dart';import 'package:top_snackbar_flutter/tap_bounce_container.dart';class Login extends StatefulWidget {  @override  _LoginState createState() => _LoginState();}class _LoginState extends State<Login>  {    TextEditingController  _userNamelController = TextEditingController();    TextEditingController  _passwordController = TextEditingController();    TextEditingController  _dataBaseController = TextEditingController();  // final Faluir = SnackBar(content: Text(' خطاء في التسجيل'));  // final  succes= SnackBar(content: Text(' تم التسجيل'));  // String? validatePassword(String value) {  //   if (value.isEmpty) {  //     return "* Required";  //   } else if (value.length < 6) {  //     return "Password should be atleast 6 characters";  //   } else if (value.length > 15) {  //     return "Password should not be greater than 15 characters";  //   } else  //     return null;  // }  @override  void initState() {    super.initState();    // _userNamelController.addListener(() {    //   final String text = _userNamelController.text.toLowerCase();    //   _userNamelController.value = _userNamelController.value.copyWith(    //     text: text,    //     selection:    //     TextSelection(baseOffset: text.length, extentOffset: text.length),    //     composing: TextRange.empty,    //   );    // });    _passwordController.addListener(() {      final String text = _passwordController.text.toLowerCase();      _passwordController.value = _passwordController.value.copyWith(        text: text,        selection:        TextSelection(baseOffset: text.length, extentOffset: text.length),        composing: TextRange.empty,      );    });  }  @override  Widget build(BuildContext context) {    return Scaffold(      backgroundColor: Color.fromRGBO(167, 53, 58 ,100),      // appBar: AppBar(      //   title: Text("Login Page"),      // ),      body: SingleChildScrollView(        child:Material(          color:Color.fromRGBO(167, 53, 58 ,100),          child:         Form(          autovalidate: true, //check for validation while typing          child: Column(            children: <Widget>[              SizedBox(                height: 40,              ),              Padding(                padding: const EdgeInsets.all( 30.0),                child: Center(                  child: Container(                      width: 200,                      height: 150,                      child: Image.asset('asset/images/LOGO-01-3.jpeg')),                ),              ),              SizedBox(height: 20,),              Padding(                padding: EdgeInsets.symmetric(horizontal: 15),                child:                TextFormField(                  style: TextStyle(fontSize: 18, color: Colors.white),                  controller: _dataBaseController,                    cursorColor: Colors.white,                    decoration: InputDecoration(                      hoverColor: Colors.white,                      focusColor: Colors.white,                         border: OutlineInputBorder(                           borderSide:  BorderSide(color: Colors.white ),                         ),                        labelText: AppController.strings.dataBase,                        labelStyle: TextStyle( color: Colors.white),                        hintText: AppController.strings.EnterDtaBase,                    ),                  ),              ),              SizedBox(                height: 15,              ),              Padding(                padding: EdgeInsets.symmetric(horizontal: 15),                child:                TextFormField(                  style: TextStyle(fontSize: 18, color: Colors.white),                  controller: _userNamelController,                  cursorColor: Colors.white,                  decoration: InputDecoration(                      hoverColor: Colors.white,                      focusColor: Colors.white,                      border: OutlineInputBorder(                        borderSide:  BorderSide(color: Colors.white ),                      ),                      labelText: AppController.strings.userName,                      labelStyle: TextStyle( color: Colors.white),                      hintText: AppController.strings.EnterUserName,                  ),                ),              ),              Padding(                padding: const EdgeInsets.only(                    left: 15.0, right: 15.0, top: 15, bottom: 0),                child: TextFormField(                  style: TextStyle(fontSize: 18, color: Colors.white),                  controller: _passwordController,                    obscureText: true,                    cursorColor: Colors.white,                    decoration: InputDecoration(                      focusColor: Colors.white,                        border: OutlineInputBorder(                          borderSide:  BorderSide(color: Colors.white ),                        ),                        labelText: AppController.strings.Password,                        labelStyle: TextStyle( color: Colors.white),                        hintText:AppController.strings.ScuirePassword ),                  //validatePassword,        //Function to check validation                ),              ),              // FlatButton(              //   onPressed: () {              //     //TODO FORGOT PASSWORD SCREEN GOES HERE              //   },              //   child: Text(              //     'Forgot Password',              //     style: TextStyle(color: Colors.blue, fontSize: 15),              //   ),              // ),              SizedBox(                height: 40,              ),              Container(                height: 50,                width: 250,                decoration: BoxDecoration(                    color: Colors.white,                    borderRadius: BorderRadius.circular(20)),                child: ElevatedButton(                 style:  ElevatedButton.styleFrom(                   primary: Colors.white, // background                   onPrimary: Colors.white, // foreground                 ),                  onPressed: ()async                  {                    late var data;                    data={                      'database':_dataBaseController.text,                      'usernameapi':_userNamelController.text,                      'passwordapi':_passwordController.text.toString(),                    };                    var user=_userNamelController.text;                    var dataBase = _dataBaseController.text;                    SharedPreferences prefs = await SharedPreferences.getInstance();                    prefs.setString('shahwan',dataBase.toString());                    prefs.setString('UserName',user.toString());                    data = await  Service("login_api").Post(data);                    print(data.toString());                    // print( "data['result']=='failure'.toString()" +                    //     data.toString());                     if (data['result']=='success' ) {                       // Navigator.of(context).pushNamed('/HomePage');                       //  globals.storage!.setItem('OdooApi', OdooApi.toString());                       String OdooApi= data['OdooApi'];                       prefs.setString('OdooApi',OdooApi);                        showTopSnackBar(                          context,                          CustomSnackBar.success(                            message:"${AppController.strings.SingInMassages}"                          ,                          ),                        );                       Navigator.of(context).pushReplacement(                           MaterialPageRoute(                               builder: (context) => HomePage()));                     }                     else  {                      showTopSnackBar(                        context,                        CustomSnackBar.error(                          message:"${AppController.strings.FiulerSinginIn}"                        ,                        ),                      );                     } ;                     // else   {                     //  showTopSnackBar(                     //    context,                     //    CustomSnackBar.error(                     //      message:                     //      "  فشل في التسجيل",                     //    ),                     //  );                     // } ;                    // WidgetsBinding.instance!.addPostFrameCallback((_) => _userNamelController                    //     .clear());                  },                  child: Text(                   "${AppController.strings.SingInButton}",                    style: TextStyle(color: Colors.black, fontSize: 25),                  ),                ),              ),              Padding(                padding: const EdgeInsets.all(20),                child: Container(                  height: 50,                  width: 150,                  decoration: BoxDecoration(                      color: Colors.white,                      borderRadius: BorderRadius.circular(20)),                  child: ElevatedButton(                      style:  ElevatedButton.styleFrom(                        primary: ShahwanColor, // background                        onPrimary: Colors.white, // foreground                      ),                      child: Text('العربية' ,  style: TextStyle(color: Colors.white, fontSize: 15),),                      onPressed: () {                        setState(() {                          AppController.textDirection =                              TextDirection.rtl;                          AppController.strings =                              ArabicString();                          // Navigator.pushReplacement(                          // context,                          // MaterialPageRoute(                          // builder: (context) =>                          // navigation_bar(),                          // ));                          AppSharedPrefs.saveMainLangInSP(true);                          AppSharedPrefs.saveLangType('Ar');                        });                      }),                ),              ),              // width: 300.0,              Padding(                  padding: const EdgeInsets.all(10),                  child: Container(                    height: 50,                    width: 150,                    decoration: BoxDecoration(                        color: Colors.white,                        borderRadius: BorderRadius.circular(20)),                    child: ElevatedButton(                        style:  ElevatedButton.styleFrom(                          primary: ShahwanColor, // background                          onPrimary: Colors.white, // foreground                        ),                        child: Text('English' ,  style: TextStyle(color: Colors.white, fontSize: 15),),                        onPressed: () {                          setState(() {                            AppController.textDirection =                                TextDirection.ltr;                            AppController.strings =                                EnglishString();                            AppSharedPrefs.saveMainLangInSP(                                true);                         AppSharedPrefs.saveLangType('En');                            // Navigator.pushReplacement(                            // context,                            // MaterialPageRoute(                            // builder: (context) =>                            // navigation_bar(),                            // ));                          });                        }),                  )),              SizedBox(                height: MediaQuery.of(context).size.height*0.20,              ),            ],          ),        ),      ),    ));  }}