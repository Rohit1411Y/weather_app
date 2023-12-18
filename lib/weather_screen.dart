

import 'dart:ui';

import 'package:flutter/material.dart';

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
                   Text("450°F",style:
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
            ForecastPerHour(),
            ForecastPerHour(),
            ForecastPerHour(),
            ForecastPerHour(),
            ForecastPerHour()
             
            ],
           ),
         ),
         
       const SizedBox(height: 10,),
       const Placeholder(fallbackHeight: 150,),
        ]),
      ),
    );
  }
}
class ForecastPerHour extends StatelessWidget {
  const ForecastPerHour({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
                width: 100,
                child: Card(
                  elevation: 7,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: const [
                        Text('6:00',
                        style: TextStyle(fontSize: 16,
                        fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.cloud,
                        size: 32,),
                        SizedBox(height: 8,),
                        Text("421.14"),
                      ],
                    ),
                  ),
                ),
              );
  }
}