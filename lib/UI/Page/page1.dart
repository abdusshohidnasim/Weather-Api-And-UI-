import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:wather_api_and_ui/UI/Wized/page2_top_bar.dart';
import '../Porovider/theme_mode_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GetGeolocator() async {
    LocationPermission parmition = await Geolocator.checkPermission();
    if (parmition == LocationPermission.denied ||
        parmition == LocationPermission.deniedForever) {
      print("Location Dinnied");
      LocationPermission ask = await Geolocator.requestPermission();
    } else {
      Position currentlocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      print("Current Location ${currentlocation.latitude.toString()}");
      print("Current Location ${currentlocation.longitude.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    print("buil"); // শুধুমাত্র page build হলে print হবে
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Consumer<Theme1>(
              builder: (context, themeProvider, child) {
                return TopBar(
                  () {
                    themeProvider.switchLight();
                  },
                  () {
                    themeProvider.switchNight();
                  },
                );
              },
            ),
          ElevatedButton(onPressed: (){
            GetGeolocator();
          }, child: Text("currten location ")),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
