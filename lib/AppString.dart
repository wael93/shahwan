import 'dart:ui';

abstract class Strings {
 String?  appName;
 String? dataBase;
 String? EnterDtaBase;
 String? userName;


}

class EnglishString extends Strings {
  EnglishString() {
    appName = 'Al Hud hud';
    dataBase = ' Database ';
    EnterDtaBase = " Type DataBase";
    userName = " User Name";



  }
}

class ArabicString extends Strings {
  ArabicString() {
    appName = 'الهدهد';
    dataBase = 'قاعدة البيانات';
    EnterDtaBase=' ادخل قاعدة البيانات ';
    userName = " اسم المستخدم";

  }
}
