import 'dart:ui';

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
  }
}
