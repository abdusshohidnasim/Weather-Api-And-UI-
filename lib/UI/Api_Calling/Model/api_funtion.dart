import 'frist_page.dart';
import 'package:http/http.dart' as http;


  Future<Fristpage?> Faristpabeapi ()async {
    String baseuril =  "http://api.weatherapi.com/v1/forecast.json ";
    final respons = await http.get(Uri.parse("$baseuril?key=72e7e4f689134be0b3640336252309&q=dhaka&dt=2025-10-23"),

        headers: {
          "key":"72e7e4f689134be0b3640336252309",
          "q": "dhaka",
          "dt": "2025-10-23",
        });
    try{
      if(respons.statusCode == 200){
        return fristpageFromJson(respons.body);
      }
      else{
        print("statusCode ${respons.statusCode}");
        return null;
      }
    }catch(e){
      print("cace error $e ");
      return null;


    }
  }
