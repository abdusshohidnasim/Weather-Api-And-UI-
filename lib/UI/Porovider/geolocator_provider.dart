import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class Gealocator with ChangeNotifier{
  double? _Latitude ;
  double? _Longtitude ;
  String _Status = "Cutrrent location ";
   String? _address;
   String? get Address => _address;
  double? get Latude => _Latitude;
  double? get Longtitude => _Longtitude;
  Future GetGeolocator() async {
    LocationPermission parmition = await Geolocator.checkPermission();
    if (parmition == LocationPermission.denied ||
        parmition == LocationPermission.deniedForever) {
      print("Location Dinnied");
      LocationPermission ask = await Geolocator.requestPermission();
    } else {
      Position currentlocation = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      _Latitude = currentlocation.latitude;
      _Longtitude = currentlocation.longitude;
      print("Current Location ${currentlocation.latitude.toString()}");
      print("Current Location ${currentlocation.longitude.toString()}");
    }
    if(_Latitude != null && _Longtitude != null){
      try{
        List<Placemark> Placemarks = await placemarkFromCoordinates(_Latitude!, _Longtitude!);
        if(Placemarks.isNotEmpty){
          Placemark plac = Placemarks.first;
          _address = " ${plac.locality?? "locality"}  ${plac.country?? "country"}";
        }
        else{
          _address = "Addrrss in not fond ";
        }

      }catch(e){
        print(e);
        _address = "Data is not available  $e ";

      }

    }else{

      _address = "safe else data is not found ";
    }

    notifyListeners();
  }
}