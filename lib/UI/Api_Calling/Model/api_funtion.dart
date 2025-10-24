import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'frist_page.dart';

class Apifuntion with ChangeNotifier{
  Fristpage? _wather;
  String? _error;
  bool _isloding= false;
  Fristpage? get Wather => _wather;
  String? get Error => _error;
  bool get IsLoding => _isloding;

  Future<Fristpage?> fetchWeatherData() async {
    try {
      _isloding = true;
      notifyListeners();
      // 🔗 Using HTTPS (very important)
      final url = Uri.parse(
        "https://api.weatherapi.com/v1/forecast.json"
            "?key=72e7e4f689134be0b3640336252309"
            "&q=dhaka"
            "&dt=2025-10-23",
      );

      final response = await http.get(url);

      print("API Called: ${url.toString()}");
      print("Status Code: ${response.statusCode}");

      if (response.statusCode == 200) {
        print("Success");

        _wather= fristpageFromJson(response.body);
      } else {
        print("API Error: ${response.statusCode}");
        print("Response Body: ${response.body}");
        _error = "stasuscode:   ${response.statusCode }";
      }
    } catch (e) {
      print("Exception while fetching weather: $e");
      _error = "exception erroer : ${e}";
    }finally{
      _isloding = false;
      notifyListeners()
      ;
    }
  }
}