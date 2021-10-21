import 'package:flutter/material.dart';import 'package:form_field_validator/form_field_validator.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:shahwan/Homepage.dart';import 'package:shared_preferences/shared_preferences.dart';import 'Services/service.dart';import 'package:shahwan/globals.dart' as globals;import 'package:snack/snack.dart';import 'package:top_snackbar_flutter/top_snack_bar.dart';import 'package:top_snackbar_flutter/custom_snack_bar.dart';import 'package:top_snackbar_flutter/tap_bounce_container.dart';class Login extends StatefulWidget {  @override  _LoginState createState() => _LoginState();}class _LoginState extends State<Login>  {  final  TextEditingController  _userNamelController = TextEditingController();  final  TextEditingController  _passwordController = TextEditingController();  // final Faluir = SnackBar(content: Text(' خطاء في التسجيل'));  // final  succes= SnackBar(content: Text(' تم التسجيل'));  // String? validatePassword(String value) {  //   if (value.isEmpty) {  //     return "* Required";  //   } else if (value.length < 6) {  //     return "Password should be atleast 6 characters";  //   } else if (value.length > 15) {  //     return "Password should not be greater than 15 characters";  //   } else  //     return null;  // }  @override  void initState() {    super.initState();    _userNamelController.addListener(() {      final String text = _userNamelController.text.toLowerCase();      _userNamelController.value = _userNamelController.value.copyWith(        text: text,        selection:        TextSelection(baseOffset: text.length, extentOffset: text.length),        composing: TextRange.empty,      );    });    _passwordController.addListener(() {      final String text = _passwordController.text.toLowerCase();      _passwordController.value = _passwordController.value.copyWith(        text: text,        selection:        TextSelection(baseOffset: text.length, extentOffset: text.length),        composing: TextRange.empty,      );    });  }  @override  Widget build(BuildContext context) {    return Scaffold(      backgroundColor: Color.fromRGBO(167, 53, 58 ,100),      // appBar: AppBar(      //   title: Text("Login Page"),      // ),      body: SingleChildScrollView(        child:Material(          color:Color.fromRGBO(167, 53, 58 ,100),          child:        Form(          autovalidate: true, //check for validation while typing          child: Column(            children: <Widget>[              SizedBox(                height: 40,              ),              Padding(                padding: const EdgeInsets.only(top: 60.0),                child: Center(                  child: Container(                      width: 200,                      height: 150,                      child: Image.asset('asset/images/LOGO-01-3.png')),                ),              ),              Padding(                padding: EdgeInsets.symmetric(horizontal: 15),                child: TextFormField(                    controller: _userNamelController,                    cursorColor: Colors.white,                    decoration: InputDecoration(                        border: OutlineInputBorder(),                        labelText: 'اسم المستخدم',                        labelStyle: TextStyle( color: Colors.white),                        hintText: 'ادخل اسم المستخدم'),                  ),              ),              SizedBox(                height: 15,              ),              Padding(                padding: const EdgeInsets.only(                    left: 15.0, right: 15.0, top: 15, bottom: 0),                child: TextFormField(                    controller: _passwordController,                    obscureText: true,                    cursorColor: Colors.white,                    decoration: InputDecoration(                      focusColor: Colors.white,                        border: OutlineInputBorder(),                        labelText: 'كلمة السر ',                        labelStyle: TextStyle( color: Colors.white),                        hintText: 'ادخل كلمة سر امنة '),                  //validatePassword,        //Function to check validation                ),              ),              // FlatButton(              //   onPressed: () {              //     //TODO FORGOT PASSWORD SCREEN GOES HERE              //   },              //   child: Text(              //     'Forgot Password',              //     style: TextStyle(color: Colors.blue, fontSize: 15),              //   ),              // ),              SizedBox(                height: 40,              ),              Container(                height: 50,                width: 250,                decoration: BoxDecoration(                    color: Colors.white,                    borderRadius: BorderRadius.circular(20)),                child: FlatButton(                  onPressed: ()async                  {                    var data;                    data={                      'database':'shahwan',                      'usernameapi':_userNamelController.text,                      'passwordapi':_passwordController.text.toString(),                    };                    var user=_userNamelController.text;                    SharedPreferences prefs = await SharedPreferences.getInstance();                    prefs.setString('shahwan','shahwan');                    prefs.setString('UserName',user.toString());                    print(data.toString());                    data = await  Service("login_api").Post(data);                   String? OdooApi= data['OdooApi'];                    prefs.setString('OdooApi',OdooApi.toString());                    // print( "data['result']=='failure'.toString()" +                    //     data.toString());                     if (data['result']=='success') {                       // Navigator.of(context).pushNamed('/HomePage');                        globals.storage!.setItem('OdooApi', OdooApi.toString());                        showTopSnackBar(                          context,                          CustomSnackBar.success(                            message:                            "تم التسجيل بنجاح",                          ),                        );                       Navigator.of(context).pushReplacement(                           MaterialPageRoute(                               builder: (context) => HomePage()));                     }else  {                      showTopSnackBar(                        context,                        CustomSnackBar.error(                          message:                          "  فشل في التسجيل",                        ),                      );                     } ;                     // else   {                     //  showTopSnackBar(                     //    context,                     //    CustomSnackBar.error(                     //      message:                     //      "  فشل في التسجيل",                     //    ),                     //  );                     // } ;                    // WidgetsBinding.instance!.addPostFrameCallback((_) => _userNamelController                    //     .clear());                  },                  child: Text(                    'تسجيل  الدخول ',                    style: TextStyle(color: Colors.black, fontSize: 25),                  ),                ),              ),              SizedBox(                height: 500,              ),            ],          ),        ),      ),    ));  }}