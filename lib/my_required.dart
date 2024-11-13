import 'package:equatable/equatable.dart';

class MyRequired extends Equatable {
  final String cityName;
  final bool isCityWeather;
  final String lat;
  final String lon;

  const MyRequired(
      {required this.cityName,
      required this.isCityWeather,
      required this.lat,
      required this.lon});

  @override
  List<Object?> get props => [cityName, isCityWeather, lat, lon];
}
