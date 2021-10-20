import 'dart:convert';import 'dart:async';import 'dart:io';import 'package:flutter/material.dart';import 'package:shahwan/Services/base.dart';import 'package:http/http.dart' as http ;// class NetworkHelper {//   NetworkHelper(this.url);//   final url;//   Future <dynamic> getdata()async{//     http.Response response = await http.get(url);//     if (response.statusCode == 200) {//       final extractdata= json.decode(response.body.replaceAll("'",'"').replaceAll("False", "\"False\"").replaceAll('<p>', "").replaceAll('</p>', ''));//       return extractdata;//     }else {//       print(response.statusCode);//     }//////   }// }class Service extends BaseService {  Service(String serviceName) :super(serviceName);  String serializeArray(List arg) {    if (arg == null)      return '';    return "?" + arg.join('&');  }  Future <Map> Get(List body) async {    var url = Uri.parse(        this.base_url + '/' + this.serviceName + this.serializeArray(body));    print("URL >>>   " + url.toString());    http.Response response = await http.get(url, headers:null);     print("response>>>>>>>>>>>" + response.body);    if (response.statusCode == 200) {      final data= json.decode(response.body.replaceAll("'",'"').replaceAll("False", "\"False\"").replaceAll('<p>', "").replaceAll('</p>', ''));      // print("data.runtimeType" + data.runtimeType.toString());      print("DATA >>>> " + data.toString());      if (data is List) {        return {"items": data};      }      return data;    } else {      return {};    }  }  Future <Map> Post(Map body) async {    var url = Uri.parse(this.base_url + '/' + this.serviceName);    print(url);    http.Response response = await http.post(url , headers: null , body: body );    // print("print(jsonEncode(body) );"+response.toString() );    if (response.statusCode == 200) {      var data = json.decode(response.body);      // print(" response.body;"+response.body.toString());      //  print( data.toString() );      return data;    } else {      return {};    }  }  Future <Object> Post1(Map body) async {    var url = Uri.parse(this.base_url + '/' + this.serviceName);    print("URLPOST >>>   " + url.toString());    http.Response response = await http.post(        url, headers: null, body:  body);    // print("response >>>   " + response.toString());    if (response.statusCode == 200) {        final extractdata = json.decode((response.body.replaceAll("'", '"')            .replaceAll("False", "\"False\"").replaceAll('<p>', "")            .replaceAll('</p>', '').replaceAll(r"u", "").replaceAll(r"\", "")));        print("extractdata >>>   " + extractdata.toString());        final DataCell =  json.encode(extractdata);        print("DataCell >>>   " + DataCell.toString());        // print("extractdata" + extractdata.toString());        return DataCell;    }else{    return{};    }  }  Future <Object> Put(Map body) async {    var url = Uri.parse(this.base_url + '/' + this.serviceName);    print(url);    http.Response response = await http.put(        url, headers: null, body: jsonEncode(body));    if (response.statusCode == 201) {      // print(json.decode(response.body));      return json.decode(response.body);    } else {      print(response.body);      return {};    }  }}