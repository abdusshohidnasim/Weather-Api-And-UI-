import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../Api_Calling/Model/api_funtion.dart';


Expanded expanded() {
  return Expanded(
    child: Consumer<Apifuntion>(
      builder: (context, Wathermodel, child) {
        if (Wathermodel.IsLoding) {
          return const Center(child: CircularProgressIndicator());
        } else if (Wathermodel.Error != null) {
          return Center(child: Text("⚠️ ${Wathermodel.Error}"));
        } else if (Wathermodel.Wather == null) {
          return const Center(child: Text("No Weather Data"));
        } else {
          final forecastDay = Wathermodel.Wather!.forecast.forecastday[0];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "${Wathermodel.Wather!.current.tempC}°C",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(
                child: Text(
                  Wathermodel.Wather!.location.name,
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const Text("Temp", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("${Wathermodel.Wather!.current.tempC}°C"),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("Wind", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("${Wathermodel.Wather!.current.windKph} km/h"),
                    ],
                  ),
                  Column(
                    children: [
                      const Text("Humidity", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("${Wathermodel.Wather!.current.humidity}%"),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text("Today", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: forecastDay.hour.length,
                  itemBuilder: (context, index) {
                    final hourData = forecastDay.hour[index];
                    return Container(
                      width: 90,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/rain2.jpeg", height: 30),
                          const SizedBox(height: 5),
                          Text(hourData.time.split(" ").last), // সময় শুধু HH:MM
                          Text("${hourData.tempC.toStringAsFixed(1)}°C"), // তাপমাত্রা
                          Text("${hourData.windKph.toStringAsFixed(1)} km/h"), // বাতাসের গতি
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    ),
  );
}









//
// Expanded expanded (){
//   return    Expanded(
//     child: Consumer<Apifuntion>(
//       builder: (context, Wathermodel, child) {
//         if (Wathermodel.IsLoding) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (Wathermodel.Error != null) {
//           return Center(child: Text("⚠️ ${Wathermodel.Error}"));
//         } else if (Wathermodel.Wather == null) {
//           return const Center(child: Text("No Weather Data"));
//         } else {
//           return Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Text(
//                   "${Wathermodel.Wather!.current.tempF}°C",
//                   style: const TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Center(
//                 child: Text(
//                   "${Wathermodel.Wather!.location.name}",
//                   style: const TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//
//
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   SizedBox(child: Column(children: [
//                     Text("Temp", style: const TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                     ),),
//                     Text("${Wathermodel.Wather!.current.tempC}",style: const TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                     ),)
//                   ],),),
//                   SizedBox(child: Column(children: [
//                     Text("Wind",style: const TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                     ),),
//                     Text("${Wathermodel.Wather!.current.windKph}Km/h",style: const TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                     ),)
//                   ],),),
//                   SizedBox(child: Column(children: [
//                     Text("Temp",style: const TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                     ),),
//                     Text("${Wathermodel.Wather!.current.humidity}%",style: const TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.bold,
//                     ),)
//                   ],),)
//                 ],),
//               SizedBox(height: 20,),
//
//                 Text("Today",style: const TextStyle(
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold,
//                 ),),
//               SizedBox(height: 10,),
//               Expanded(
//                 child: ListView.builder(
//                     itemCount: 12,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context,index){
//                       print(Wathermodel.Wather!.forecast.forecastday[0].hour[index]
//                       );
//                   return Container(
//                     width: 80,
//                     margin: EdgeInsets.symmetric(horizontal: 10),
//                     child: Column(children: [
//                      Image(image: AssetImage("assets/images/rain2.jpeg",),height: 30,),
//                       Text("${Wathermodel.Wather!.forecast.forecastday[0].hour[index].toString()
//                       }")
//                     ],),
//                   );
//                 }),
//               )
//
//             ],
//           );
//         }
//       },
//     ),
//   );
// }