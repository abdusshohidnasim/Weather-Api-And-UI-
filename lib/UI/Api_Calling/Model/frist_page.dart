import 'dart:convert';

Fristpage fristpageFromJson(String str) => Fristpage.fromJson(json.decode(str));

String fristpageToJson(Fristpage data) => json.encode(data.toJson());

class Fristpage {
  Location location;
  Current current;
  Forecast forecast;

  Fristpage({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory Fristpage.fromJson(Map<String, dynamic> json) => Fristpage(
    location: Location.fromJson(json["location"]),
    current: Current.fromJson(json["current"]),
    forecast: Forecast.fromJson(json["forecast"]),
  );

  Map<String, dynamic> toJson() => {
    "location": location.toJson(),
    "current": current.toJson(),
    "forecast": forecast.toJson(),
  };
}

class Location {
  String name;
  String region;
  String country;
  double lat;
  double lon;
  String tzId;
  int localtimeEpoch;
  String localtime;

  Location({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    name: json["name"] ?? "",
    region: json["region"] ?? "",
    country: json["country"] ?? "",
    lat: (json["lat"] ?? 0).toDouble(),
    lon: (json["lon"] ?? 0).toDouble(),
    tzId: json["tz_id"] ?? "",
    localtimeEpoch: json["localtime_epoch"] ?? 0,
    localtime: json["localtime"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "region": region,
    "country": country,
    "lat": lat,
    "lon": lon,
    "tz_id": tzId,
    "localtime_epoch": localtimeEpoch,
    "localtime": localtime,
  };
}

class Current {
  double tempC;
  double tempF;
  int isDay;
  Condition condition;
  double windKph;
  int humidity;
  double feelslikeC;
  double uv;

  Current({
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
    required this.windKph,
    required this.humidity,
    required this.feelslikeC,
    required this.uv,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
    tempC: (json["temp_c"] ?? 0).toDouble(),
    tempF: (json["temp_f"] ?? 0).toDouble(),
    isDay: json["is_day"] ?? 1,
    condition: Condition.fromJson(json["condition"] ?? {}),
    windKph: (json["wind_kph"] ?? 0).toDouble(),
    humidity: json["humidity"] ?? 0,
    feelslikeC: (json["feelslike_c"] ?? 0).toDouble(),
    uv: (json["uv"] ?? 0).toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "temp_c": tempC,
    "temp_f": tempF,
    "is_day": isDay,
    "condition": condition.toJson(),
    "wind_kph": windKph,
    "humidity": humidity,
    "feelslike_c": feelslikeC,
    "uv": uv,
  };
}

class Condition {
  String text;
  String icon;
  int code;

  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
    text: json["text"] ?? "",
    icon: json["icon"] ?? "",
    code: json["code"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "icon": icon,
    "code": code,
  };
}

class Forecast {
  List<Forecastday> forecastday;

  Forecast({required this.forecastday});

  factory Forecast.fromJson(Map<String, dynamic> json) => Forecast(
    forecastday: json["forecastday"] == null
        ? []
        : List<Forecastday>.from(
        json["forecastday"].map((x) => Forecastday.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "forecastday": List<dynamic>.from(forecastday.map((x) => x.toJson())),
  };
}

class Forecastday {
  String date;
  Day day;
  Astro astro;
  List<Hour> hour; // ✅ Added Hour List

  Forecastday({
    required this.date,
    required this.day,
    required this.astro,
    required this.hour,
  });

  factory Forecastday.fromJson(Map<String, dynamic> json) => Forecastday(
    date: json["date"] ?? "",
    day: Day.fromJson(json["day"] ?? {}),
    astro: Astro.fromJson(json["astro"] ?? {}),
    hour: json["hour"] == null
        ? []
        : List<Hour>.from(json["hour"].map((x) => Hour.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "day": day.toJson(),
    "astro": astro.toJson(),
    "hour": List<dynamic>.from(hour.map((x) => x.toJson())),
  };
}

class Day {
  double maxtempC;
  double mintempC;
  double avgtempC;
  Condition condition;

  Day({
    required this.maxtempC,
    required this.mintempC,
    required this.avgtempC,
    required this.condition,
  });

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    maxtempC: (json["maxtemp_c"] ?? 0).toDouble(),
    mintempC: (json["mintemp_c"] ?? 0).toDouble(),
    avgtempC: (json["avgtemp_c"] ?? 0).toDouble(),
    condition: Condition.fromJson(json["condition"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "maxtemp_c": maxtempC,
    "mintemp_c": mintempC,
    "avgtemp_c": avgtempC,
    "condition": condition.toJson(),
  };
}

class Astro {
  String sunrise;
  String sunset;
  String moonrise;
  String moonset;

  Astro({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
  });

  factory Astro.fromJson(Map<String, dynamic> json) => Astro(
    sunrise: json["sunrise"] ?? "",
    sunset: json["sunset"] ?? "",
    moonrise: json["moonrise"] ?? "",
    moonset: json["moonset"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "sunrise": sunrise,
    "sunset": sunset,
    "moonrise": moonrise,
    "moonset": moonset,
  };
}

/// ✅ New Hour Class for per-hour forecast
class Hour {
  String time;
  double tempC;
  double windKph;
  int humidity;
  Condition condition;

  Hour({
    required this.time,
    required this.tempC,
    required this.windKph,
    required this.humidity,
    required this.condition,
  });

  factory Hour.fromJson(Map<String, dynamic> json) => Hour(
    time: json["time"] ?? "",
    tempC: (json["temp_c"] ?? 0).toDouble(),
    windKph: (json["wind_kph"] ?? 0).toDouble(),
    humidity: json["humidity"] ?? 0,
    condition: Condition.fromJson(json["condition"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "time": time,
    "temp_c": tempC,
    "wind_kph": windKph,
    "humidity": humidity,
    "condition": condition.toJson(),
  };
}
