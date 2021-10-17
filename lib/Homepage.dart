import 'package:flutter/material.dart';import 'package:shahwan/login.dart';import 'package:shahwan/constants.dart';import 'package:flutter_svg/flutter_svg.dart';import 'package:shahwan/Services/service.dart';import 'package:shahwan/scannPage.dart';import 'package:shahwan/recive.dart';class HomePage extends StatefulWidget {  var productsServies;  @override  _HomePageState createState() => _HomePageState();}class _HomePageState extends State<HomePage> {  @override  Widget build(BuildContext context) {    var data;    var args;    return Scaffold(        appBar: AppBar(          leading: IconButton(            iconSize: 40,            onPressed: () {},            icon: const Icon(Icons.menu),          ),          backgroundColor: ShahwanColor,          title: Text('الصفحة الرئيسية'),        ),        body: GridView.count(          primary: true,          shrinkWrap: true,          physics: NeverScrollableScrollPhysics(),          crossAxisCount: 2,          children: <Widget>[                    SizedBox(                      height: 20,                    ),                    Column(children: [                      MaterialButton(                        child: Column(                          children: [                            Container(                              child: Center(                                heightFactor: 100,                                widthFactor: 100,                                child: IconButton(                                    highlightColor: Colors.white12,                                    hoverColor: Colors.yellow,                                    iconSize: 200,                                    icon: SvgPicture.asset(                                      'asset/images/icons8-total-sales.svg',                                      color: Colors.white,                                    ),                                    onPressed: () async => {                                      Navigator.of(context).pushReplacement(                                          MaterialPageRoute(                                              builder: (context) => Scanne())),                                      //      data={                                      //                                      //          'database': 'shahwan',                                      //          'usernameapi': 'admin',                                      //          'passwordapi': '123123',                                      //                                      //                                      //      } ,                                      //    data = await  Service("login_api").Post(data),                                      // print(data.toString())                                    }),                              ),                              height: 150,                              width: 150,                              decoration: BoxDecoration(                                  color: ShahwanColor,                                  borderRadius: BorderRadius.circular(4)),                            ),                            Container(                              child: Center(                                child: Text('المبيعات'),                              ),                              height: 50,                              width: 150,                              decoration: BoxDecoration(                                  color: MainPageWidgit,                                  borderRadius: BorderRadius.circular(0)),                            ),                          ],                        ),                        onPressed: () => {                          // Navigator.of(context).pushReplacement(                          // MaterialPageRoute(                          // builder: (context) =>  null()))                        },                      )                    ]),                    SizedBox(                      height: 20,                    ),                    Column(children: [                      MaterialButton(                        child: Column(                          children: [                            Container(                              child: Center(                                heightFactor: 100,                                widthFactor: 100,                                child: IconButton(                                  highlightColor: Colors.white12,                                  hoverColor: Colors.yellow,                                  iconSize: 200,                                  icon: SvgPicture.asset(                                    'asset/images/icons8-total-sales.svg',                                    color: Colors.white,                                  ),                                  onPressed: () => {                                    Navigator.of(context).pushReplacement(                                        MaterialPageRoute(                                            builder: (context) => QRViewExample()))                                  },                                ),                              ),                              height: 150,                              width: 150,                              decoration: BoxDecoration(                                  color: ShahwanColor,                                  borderRadius: BorderRadius.circular(4)),                            ),                            Container(                              child: Center(                                child: Text('المواصفات والكميات'),                              ),                              height: 50,                              width: 150,                              decoration: BoxDecoration(                                  color: MainPageWidgit,                                  borderRadius: BorderRadius.circular(0)),                            ),                          ],                        ),                        onPressed: () => {                          // Navigator.push(                          //   context,                          //   MaterialPageRoute(                          //       builder: (context) => new Login()),                          // )                        },                      )                    ]),                    SizedBox(                      height: 20,                    ),                    Column(children: [                      MaterialButton(                        child: Column(                          children: [                            Container(                              child: Center(                                heightFactor: 100,                                widthFactor: 100,                                child: IconButton(                                  highlightColor: Colors.white12,                                  hoverColor: Colors.yellow,                                  iconSize: 200,                                  icon: SvgPicture.asset(                                    'asset/images/icons8-total-sales.svg',                                    color: Colors.white,                                  ),                                  onPressed: () => null,                                ),                              ),                              height: 150,                              width: 150,                              decoration: BoxDecoration(                                  color: ShahwanColor,                                  borderRadius: BorderRadius.circular(4)),                            ),                            Container(                              child: Center(                                child: Text('الجرد'),                              ),                              height: 50,                              width: 150,                              decoration: BoxDecoration(                                  color: MainPageWidgit,                                  borderRadius: BorderRadius.circular(0)),                            ),                          ],                        ),                        onPressed: () => {                          Navigator.push(                            context,                            MaterialPageRoute(builder: (context) => new Login()),                          )                        },                      )                    ])                  ],                ),        );  }}