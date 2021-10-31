import 'dart:ui';

import 'package:flutter/cupertino.dart';

abstract class Strings {
  String? appName;
  String? dataBase;
  String? EnterDtaBase;
  String? userName;
  String? EnterUserName;
  String? Password;
  String? ScuirePassword;

  String? SingInMassages;

  String? FiulerSinginIn;

  String? SingInButton;

  String? LogOut;
  String? MainPage;
  String? Sales;
  String? Spacific;
  String? inventory;
  String? Success;
  String? ref;
  String? FauilSend;
  String? Done;
  String? TryCheck;
  String? TypeCode;
  String? AddQ;
  String? QUantity;
  String? Add;
  String? Sendd;
  String? Scan;
  String? BackPadding;
  String? ClothColor;
  String? Clothtype;
  String? DeliveryPeriod;
  String? IronColor;
  String? MaterialUsed;
  String? NoteProduct;
  String? NumberPillows;
  String? NumberSeats;
  String? ProductFeatures;
  String? SeatPadding;
  String? WoodColor;
  String? Woodtype,country_id,default_code,id,number_pieces,NOServer , SpacificValue, value ,warehouse , warehouseQ;

}

class EnglishString extends Strings {
  EnglishString() {
    appName = 'Al Hud hud';
    dataBase = ' Database ';
    EnterDtaBase = " Type DataBase";
    userName = " User Name";
    EnterUserName = "Type User Name ";
    Password = "Password";
    ScuirePassword = "Type Good Password";
    SingInMassages = " ًWelcome ";
    FiulerSinginIn = " Failure Login ";
    SingInButton = " Login ";
    LogOut = "Log Out";
    MainPage = "Main Page";
    Sales = "sales";
    Spacific = 'Specifications and Quantities';
    inventory = "inventory ";
    Success = "Success";
    ref = "Reference Number";
    Done = "Done";
    FauilSend = "Send error occurred";
    TryCheck = "Try checking the entries";
    TypeCode = "Type Code";
    AddQ = "Add Quantity";
    QUantity = "Quantity";
    Add = "Add";
    Sendd = "Send";
    Scan = "Scan";
    BackPadding = "Back Padding";
    ClothColor = " Clothe Color";
    Clothtype = " Clothe type";
    DeliveryPeriod = " Delivery Period";
    IronColor = " Iron Color";
    MaterialUsed = " Material Used";
    NoteProduct = " Note Product";
    NumberPillows = " Number Pillows";
    NumberSeats = " Number Seats";
    ProductFeatures = " Product Features";
    SeatPadding = "Seat Padding";
    WoodColor = " Wood Color";
    Woodtype = " Wood type";
    country_id = country_id;
    default_code= "  default_code";
    id= " id";
    number_pieces  = " number_pieces ";
    NOServer = " Server on Maintenance ";
    SpacificValue = "Properties  ";
    value = " Value";
    warehouse  = "Warehouse";
    warehouseQ = " Quantity";

  }
}

class ArabicString extends Strings {
  ArabicString() {
    appName = 'الهدهد';
    dataBase = 'قاعدة البيانات';
    EnterDtaBase = ' ادخل قاعدة البيانات ';
    userName = " اسم المستخدم";
    EnterUserName = 'ادخل اسم المستخدم';
    Password = 'كلمة السر ';
    ScuirePassword = 'ادخل كلمة سر امنة ';
    SingInMassages = "تم التسجيل بنجاح";
    FiulerSinginIn = "  فشل في التسجيل";
    SingInButton = ' دخول ';
    LogOut = "خروج";
    MainPage = "الصفحة الرئيسية";
    Sales = "المبيعات";
    Spacific = 'المواصفات والكميات';
    inventory = "الجرد";
    Success = "تمت العملية بنجاح ";
    ref = "الرقم المرجعي ";
    Done = "تم";
    FauilSend = "حدث خطاء في الارسال";
    TryCheck = "  حاول التاكد من المدخلات";
    TypeCode = "ادخل الكود";
    AddQ = "إضافة كمية";
    QUantity = "الكمية";
    Add = "إضافة";
    Sendd = "إرسال";
    BackPadding = " الحشوة الخلفية";
    ClothColor = " لون الملابس";
    Clothtype = " نوع الثياب";
    DeliveryPeriod = " فترة التسليم ";
    IronColor = " لون الحديدي";
    MaterialUsed= " المواد المستخدمة";
    Scan = "مسح";
    NoteProduct = "ملاحظة للمنتج ";
    NumberPillows = " عدد الوسائد ";
    NumberSeats = " عدد المقاعد";
    ProductFeatures= " ميزات المنتج";
    SeatPadding = " حشوة المقعد";
    WoodColor = " لون الخشب";
    Woodtype = " نوع الخشب";
    country_id = " رقم البلد";
    default_code= " الرقم الاساسي";
    id= " رقم";
    number_pieces  = " عدد القطع ";
    NOServer = " السيرفر تحت الصيانة";
    SpacificValue = " الخصائص";
    value = " القيمة";
    warehouse= " المستودع";
    warehouseQ = " الكمية";
  }
}
