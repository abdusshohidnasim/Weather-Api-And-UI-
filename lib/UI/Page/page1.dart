import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Api_Calling/Model/api_funtion.dart';
import '../Porovider/datetime_provider.dart';
import '../Porovider/geolocator_provider.dart';
import '../Porovider/theme_mode_provider.dart';
import '../Wized/Row.dart';
import '../Wized/page2_top_bar.dart';
import '../Api_Calling/Model/frist_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // ⚡ API call and providers initialization
    Future.microtask(() {
      Provider.of<DatetimeProvider>(context, listen: false).Date();
      Provider.of<Gealocator>(context, listen: false).GetGeolocator();
      Provider.of<Apifuntion>(context, listen: false).fetchWeatherData();
    });

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            /// 🌗 TopBar for Theme Switch
            Consumer<Theme1>(
              builder: (context, themeProvider, child) {
                return TopBar(
                  () => themeProvider.switchLight(),
                  () => themeProvider.switchNight(),
                );
              },
            ),

            /// 📍 Location from Provider
            Consumer<Gealocator>(
              builder: (context, localeProvider, child) {
                return Column(
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      localeProvider.Address ?? "Loading location...",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                );
              },
            ),

            /// 🗓️ Date from Provider
            Consumer<DatetimeProvider>(
              builder: (context, dateTimeProvider, child) {
                return Text(
                  "${dateTimeProvider.ToDayDate} ${dateTimeProvider.FormateDate}",
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),

            const SizedBox(height: 20),
            const Image(image: AssetImage("assets/images/rain2.jpeg")),
            const SizedBox(height: 20),
            const Text("Developed by Naiem Hassan Naem"),

            /// 🌦️ Weather Info
            expanded(),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import 'package:wather_api_and_ui/UI/Api_Calling/Model/frist_page.dart';
// import 'package:wather_api_and_ui/UI/Wized/page2_top_bar.dart';
//
// import '../Api_Calling/Model/api_funtion.dart';
// import '../Porovider/datetime_provider.dart';
// import '../Porovider/geolocator_provider.dart';
// import '../Porovider/theme_mode_provider.dart';
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     Future.microtask(() {
//       Provider.of<DatetimeProvider>(context, listen: false).Date();
//       Provider.of<Gealocator>(context, listen: false).GetGeolocator();
//     });
//
//     print("MyHomePage build called");
//
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             /// 🌗 TopBar for Theme Switch
//             Consumer<Theme1>(
//               builder: (context, themeProvider, child) {
//                 return TopBar(
//                       () => themeProvider.switchLight(),
//                       () => themeProvider.switchNight(),
//                 );
//               },
//             ),
//
//             /// 📍 Location from Provider
//             Consumer<Gealocator>(
//               builder: (context, localeProvider, child) {
//                 return Column(
//                   children: [
//                     const SizedBox(height: 30),
//                     Text(
//                       localeProvider.Address ?? "Loading location...",
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//
//             Consumer<DatetimeProvider>(
//               builder: (context, dateTimeProvider, child) {
//                 return Text(
//                   "${dateTimeProvider.ToDayDate} ${dateTimeProvider.FormateDate}",
//                   style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                 );
//               },
//             ),
//
//             const Image(image: AssetImage("assets/images/rain2.jpeg")),
//             const SizedBox(height: 20),
//             const Text("Developed by Naiem Hassan Naem"),
//
//             /// 🌦️ FutureBuilder to show Weather Info
//          Expanded(child:Consumer<Apifuntion>(builder: (context,Wathermodel,child){
//            if (Wathermodel.IsLoding!){
//              return Center(child: CircleAvatar(),);
//            }
//            if(Wathermodel.Error != null){
//              print('nul valu ');
//              return Text("${Wathermodel.Error }");
//            }
//            if(Wathermodel.Wather == null){
//              return Text("No Wether Data ");
//            }return Column(children: [
//              Center(child: Text("${Wathermodel.Wather?.current.tempC}°C"),)
//
//            ],);
//          }))
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
