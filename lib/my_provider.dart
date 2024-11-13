import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:wheather_app/my_required.dart';
import 'package:wheather_app/wheather_model.dart';

final myWheatherProvider =
    FutureProvider.family<Wheathermodel, MyRequired>((ref, myNeedData) {
  return MyApiData().getMyData(myNeedData);
});

class MyApiData {
  Future<Wheathermodel> getMyData(MyRequired myNeedData) async {
    try {
      const weatherAPIkey = '2bd1802d6c24859aa9204e6c5b75a89f';
      String weatherurl;
      if (myNeedData.isCityWeather) {
        weatherurl =
            'https://api.openweathermap.org/data/2.5/weather?q=${myNeedData.cityName}&appid=$weatherAPIkey&units=units=metric';
      } else {
        weatherurl =
            'https://api.openweathermap.org/data/2.5/weather?lat=${myNeedData.lat}&lon=${myNeedData.lon}&appid=$weatherAPIkey&units=units=metric';
      }
      final weatherUri = Uri.parse(weatherurl);

      final response = await http.get(weatherUri);
      return Wheathermodel.fromJson(json.decode(response.body));
    } catch (e) {
      rethrow;
    }
  }
}
