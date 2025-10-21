import 'package:flutter/material.dart';
import '../Theme_Mode/thime.dart';

class Theme1 with ChangeNotifier {
  ThemeData _themeData = LightMode;

  ThemeData get themeData => _themeData;

  // লাইট থিম সেট করার জন্য
  void switchLight() {
    _themeData = LightMode;
    notifyListeners();
  }

  // ডার্ক থিম সেট করার জন্য
  void switchNight() {
    _themeData = DarkMode;
    notifyListeners();
  }


  void toggleTheme() {
    if (_themeData == LightMode) {
      _themeData = DarkMode;
    } else {
      _themeData = LightMode;
    }
    notifyListeners();
  }
}




// import 'package:flutter/material.dart';
// import '../Theme_Mode/thime.dart';
//
// class Theme1 with ChangeNotifier {
//   ThemeData _themeData = LightMode;
//
//   ThemeData get themeData => _themeData;
//
//     ThemeData get switchlight => _themeData = LightMode;
//     ThemeData get switchnight => _themeData = DarkMode;
//
//   // void light(){
//   //   _themeData = DarkMode;
//   // }
//   // void night(){
//   //   _themeData = DarkMode;
//   // }
//
//   // void istogol() {
//   //   if (_themeData == LightMode) {
//   //     _themeData = DarkMode;
//   //   } else {
//   //     _themeData = LightMode;
//   //   }
//   //   notifyListeners();
//   // }
// }

// class Theme1 with ChangeNotifier {
//   ThemeData _Light = LightMode;
//   // ThemeData _Dark = DarkMode;
//
//   //  ThemeData get dark => _Dark;
//   ThemeData get light => _Light;
//
//   // set themeData(ThemeData themedata){
//   //   _Light = themedata;
//   //   notifyListeners();
//   // }
//   void istogol() {
//     if (_Light == LightMode) {
//       _Light = DarkMode;
//     } else {
//       _Light = LightMode;
//     }
//     notifyListeners();
//   }
// }
