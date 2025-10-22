import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:wather_api_and_ui/UI/Wized/page2_top_bar.dart';
import '../Porovider/datetime_provider.dart';
import '../Porovider/geolocator_provider.dart';
import '../Porovider/theme_mode_provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  void time() {}

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      Provider.of<DatetimeProvider>(context, listen: false).Date();

      Provider.of<Gealocator>(context, listen: false).GetGeolocator();
    });
    //LocaleProvider.GetGeolocator();
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
            Consumer<Gealocator>(
              builder: (context, LocaleProvider, child) {
                return Column(
                  children: [
                    SizedBox(height: 30),
                    Text(
                      "${LocaleProvider.Address}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                );
              },
            ),
            Consumer<DatetimeProvider>(
              builder: (context, LocalDatTime, child) {
                return Text(
                  "${LocalDatTime.ToDayDate} ${LocalDatTime.FormateDate}",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                );
              },
            ),
            Image(image: AssetImage("assets/images/rain2.jpeg")),
            Row(children: []),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
