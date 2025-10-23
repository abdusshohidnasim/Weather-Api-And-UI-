import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:wather_api_and_ui/UI/Api_Calling/Model/frist_page.dart';
import 'package:wather_api_and_ui/UI/Wized/page2_top_bar.dart';

import '../Porovider/datetime_provider.dart';
import '../Porovider/geolocator_provider.dart';
import '../Porovider/theme_mode_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  /// ✅ Weather API Function
  Future<Fristpage?> fetchWeatherData() async {
    try {
      // 🔗 Using HTTPS (very important)
      final url = Uri.parse(
        "https://api.weatherapi.com/v1/forecast.json"
            "?key=72e7e4f689134be0b3640336252309"
            "&q=dhaka"
            "&dt=2025-10-23",
      );

      final response = await http.get(url);

      print("🌐 API Called: ${url.toString()}");
      print("📡 Status Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        print("✅ Success");
        print("🧾 Raw JSON: ${response.body}");
        return fristpageFromJson(response.body);
      } else {
        print("❌ API Error: ${response.statusCode}");
        print("Response Body: ${response.body}");
        return null;
      }
    } catch (e) {
      print("⚠️ Exception while fetching weather: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    // 🔁 Initialize providers one time only
    Future.microtask(() {
      Provider.of<DatetimeProvider>(context, listen: false).Date();
      Provider.of<Gealocator>(context, listen: false).GetGeolocator();
    });

    print("🧱 MyHomePage build called");

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

            /// 🕒 Date from Provider
            Consumer<DatetimeProvider>(
              builder: (context, dateTimeProvider, child) {
                return Text(
                  "${dateTimeProvider.ToDayDate} ${dateTimeProvider.FormateDate}",
                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                );
              },
            ),

            /// ☁️ Weather Image
            const Image(image: AssetImage("assets/images/rain2.jpeg")),
            const SizedBox(height: 20),
            const Text("Developed by Naiem Hassan Naem"),

            /// 🌦️ FutureBuilder to show Weather Info
            Expanded(
              child: FutureBuilder<Fristpage?>(
                future: fetchWeatherData(),
                builder: (context, snapshot) {
                  // ⏳ Loading State
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  // ❌ Error State
                  if (snapshot.hasError) {
                    print("❌ Error Details: ${snapshot.error}");
                    return Center(
                      child: Text(
                        "Error: ${snapshot.error}",
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  }

                  // ⚠️ No Data Found
                  if (!snapshot.hasData || snapshot.data == null) {
                    print("⚠️ No data found!");
                    return const Center(
                      child: Text("No data found"),
                    );
                  }

                  // ✅ Success State (Data Available)
                  final weather = snapshot.data!;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${weather.location.name}",
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Temperature: ${weather.current.tempC}°C",
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Condition: ${weather.current.condition.texte}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

















// import 'dart:convert';
// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:wather_api_and_ui/UI/Api_Calling/Model/frist_page.dart';
// import 'package:wather_api_and_ui/UI/Wized/page2_top_bar.dart';
// import '../Api_Calling/Model/frist_page.dart';
// import '../Porovider/datetime_provider.dart';
// import '../Porovider/geolocator_provider.dart';
// import '../Porovider/theme_mode_provider.dart';
// import 'package:http/http.dart' as http;
//
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({super.key});
//   Future<Fristpage?> Faristpabeapi() async {
//     try {
//       final url = Uri.parse(
//         "https://api.weatherapi.com/v1/forecast.json"
//             "?key=72e7e4f689134be0b3640336252309"
//             "&q=dhaka"
//             "&dt=2025-10-23",
//       );
//
//       final respons = await http.get(url);
//
//       if (respons.statusCode == 200) {
//         print("Successdf ${respons.statusCode}");
//         return fristpageFromJson(respons.body);
//       } else {
//         print("API Error ${respons.statusCode}");
//         print("Response Body: ${respons.body}");
//         return null;
//       }
//     } catch (e) {
//       print("Catch error NAIEM: $e");
//       return null;
//     }
//   }
//
//
//
//
//   // Future<Fristpage?> Faristpabeapi() async {
//   //   String baseuril = "http://api.weatherapi.com/v1/forecast.json";
//   //   final respons = await http.get(
//   //     Uri.parse(
//   //       "http://api.weatherapi.com/v1/forecast.json?key=72e7e4f689134be0b3640336252309&q=dhaka&dt=2025-10-23",
//   //     ),
//   //     headers: {
//   //       "key": "72e7e4f689134be0b3640336252309",
//   //       "q": "dhaka",
//   //       "dt": "2025-10-23",
//   //     },
//   //   );
//   //   try {
//   //     if (respons.statusCode == 200) {
//   //       print(" if ${respons.statusCode}");
//   //       return fristpageFromJson(respons.body);
//   //     } else {
//   //       print(" esle ${respons.statusCode}");
//   //       print("statusCode ${respons.statusCode}");
//   //       return null;
//   //     }
//   //   } catch (e) {
//   //     print("cace error NAIEM $e ");
//   //     return null;
//   //   }
//   // }
//
//   @override
//   Widget build(BuildContext context) {
//     Future.microtask(() {
//       Provider.of<DatetimeProvider>(context, listen: false).Date();
//
//       Provider.of<Gealocator>(context, listen: false).GetGeolocator();
//     });
//     //LocaleProvider.GetGeolocator();
//     print("buil");
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: Column(
//           children: [
//             Consumer<Theme1>(
//               builder: (context, themeProvider, child) {
//                 return TopBar(
//                   () {
//                     themeProvider.switchLight();
//                   },
//                   () {
//                     themeProvider.switchNight();
//                   },
//                 );
//               },
//             ),
//             Consumer<Gealocator>(
//               builder: (context, LocaleProvider, child) {
//                 return Column(
//                   children: [
//                     SizedBox(height: 30),
//                     Text(
//                       "${LocaleProvider.Address}",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//             Consumer<DatetimeProvider>(
//               builder: (context, LocalDatTime, child) {
//                 return Text(
//                   "${LocalDatTime.ToDayDate} ${LocalDatTime.FormateDate}",
//                   style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//                 );
//               },
//             ),
//             Image(image: AssetImage("assets/images/rain2.jpeg")),
//             Row(children: []),
//             const SizedBox(height: 20),
//             Text("Naiem HassanNaem "),
//             Expanded(
//               child: FutureBuilder(
//                 future: Faristpabeapi(),
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircleAvatar(),);
//                   }
//                   if(snapshot.hasError ){
//                     print("hass erreor ${snapshot.hasError}");
//                     return Text("Hass Erro");
//                   }if (!snapshot.hasData || snapshot.data == null) {
//                     return Text("No data found");
//                   }
//                   else {
//                     final weather = snapshot.data!;
//                     return Column(
//                       children: [
//                         Text(
//                           "${weather.location.name} ${weather.current.tempF}",
//                         ),
//                       ],
//                     );
//                   }
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
