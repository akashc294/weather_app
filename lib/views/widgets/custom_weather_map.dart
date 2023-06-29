import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../../constants/apis.dart';
import '../../constants/strings.dart';

class WeatherMap{
  Widget map(double ?lat,double ?long,String layer,bool isDrag){
    return FlutterMap(
      options: MapOptions(
        center: LatLng(lat!,long!),
        zoom: 7,
          interactiveFlags:isDrag?InteractiveFlag.all:InteractiveFlag.none
      ),

      children: [
        TileLayer(
          key: Key("openstreetmap"),
          urlTemplate: APIS.baseMapURL,
          userAgentPackageName: 'com.example.app',
        ),
        TileLayer(
          key: Key("openweathermap"),
          urlTemplate: APIS.baseWeatherURL,
          subdomains: const ['a', 'b', 'c'], // Replace with appropriate subdomains
          additionalOptions: {
            'layername': layer,
          },
          backgroundColor: Colors.transparent,
        ),
        MarkerLayer(
          key: Key("marker_layer"),
          markers: [
            Marker(
              point: LatLng(lat,long),
              builder: (_) => const Icon(Icons.location_on,color: Colors.red,),
            ),
          ],
        ),
      ],
    );
  }
}