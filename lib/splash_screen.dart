import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:wheather_app/city_wheather.dart';
import 'package:wheather_app/my_provider.dart';

import 'my_required.dart';

class Splashscreen extends HookConsumerWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final myNeedData = useState<MyRequired>(const MyRequired(
        cityName: 'Pune', isCityWeather: true, lat: '0', lon: '0'));

    final wheathermodel = ref.watch(myWheatherProvider(myNeedData.value));
    log('${myNeedData.value}');
    useEffect(() {
      Future.microtask(() {});
      return null;
    }, []);
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Current Wheather')),
          actions: [
            IconButton(
              onPressed: () async {
                final tempCity = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const Citywheatherpage();
                    },
                  ),
                );
                if (tempCity != null) {
                  myNeedData.value = MyRequired(
                      cityName: tempCity,
                      isCityWeather: true,
                      lat: '0',
                      lon: '0');
                }
              },
              icon: const FaIcon(FontAwesomeIcons.mapLocation),
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: wheathermodel.when(
            data: (myData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(myData.weather!.first.main),
                  Text(myData.weather!.first.description),
                  Image.network(
                    'https://openweathermap.org/img/wn/10d@2x.png',
                    width: 200,
                    fit: BoxFit.fitWidth,
                  ),
                  Center(
                    child: Text(
                      '${myData.main.temp}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              );
            },
            error: (error, stackTrace) => const Text('Error'),
            loading: () => const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                  ),
                )));
  }
}
