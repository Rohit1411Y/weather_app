

import 'dart:ui';

import 'package:flutter/material.dart';

import 'additional_info_item.dart';
import 'forecast_per_hour.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Weather App',
        style: TextStyle(
          fontWeight: FontWeight.bold
        )
        ),
        centerTitle: true,
        actions:  [
        IconButton(onPressed: (){}, icon: const Icon(Icons.refresh))
        ],
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
          SizedBox(
            width: double.infinity,
            child: Card(
              elevation: 14,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child:
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 10,
                  sigmaY: 10
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(children: const[
                   Text("91.4°F",style:
                    TextStyle(fontSize: 32,
                    fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8,),
                    Icon(Icons.cloud,
                    size: 64,),
                    SizedBox(height: 8,),
                   Text("Rain",style: TextStyle(fontSize: 20),)
                  ],
                  ),
                ),
              ),
            ),
            ),
          ),
         const SizedBox(height: 10,),
         const Text("Weather Forecast",
         style: TextStyle(fontWeight: FontWeight.bold,
         fontSize: 24),
         ),
        const SizedBox(height: 10,),
         SingleChildScrollView(
          scrollDirection: Axis.horizontal,
           child: Row(
            children: const [
            ForecastPerHour(time: "0:00",iconData: Icons.dark_mode_rounded,temperature: "75.2",),
            ForecastPerHour(time: "3:00",iconData: Icons.dark_mode_rounded,temperature: "71.6",),
            ForecastPerHour(time: "6:00",iconData: Icons.light_mode,temperature: "77.5",),
            ForecastPerHour(time: "9:00",iconData: Icons.cloud,temperature: "69.8",),
            ForecastPerHour(time: "12:00",iconData: Icons.sunny,temperature: "82.4",)
             
            ],
           ),
         ),
         
       const SizedBox(height: 10,),
       const Text("Additional Information",
       style: TextStyle(
        fontSize: 24
       ,fontWeight: FontWeight.bold),
       ),
       const SizedBox(height: 10,),
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          AdditionalInfoItem(icon: Icons.water_drop,label: "Humidity",value: "64"),
          AdditionalInfoItem(icon: Icons.air,label: "Wind Speed",value: "6.45"),
          AdditionalInfoItem(icon: Icons.beach_access,label: "Pressure",value: "1006")
         

        ],
       )
        ]),
      ),
    );
  }
}

