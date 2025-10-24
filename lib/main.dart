import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'UI/Api_Calling/Model/api_funtion.dart';
import 'UI/Page/page1.dart';
import 'UI/Porovider/datetime_provider.dart';
import 'UI/Porovider/geolocator_provider.dart';
import 'UI/Porovider/theme_mode_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Theme1()),
        ChangeNotifierProvider(create: (_) => Gealocator()),
        ChangeNotifierProvider(create: (_) => DatetimeProvider()),
        ChangeNotifierProvider(create: (_) => Apifuntion()),
      ],
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Theme1>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: themeProvider.themeData,
          home: const MyHomePage(),
        );
      },
    );
  }
}







//
// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => Theme1()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     final thiemprovider = context.watch<Theme1>();
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: thiemprovider.themeData,
//
//
//
//       home:  MyHomePage(),
//     );
//   }
// }
//
