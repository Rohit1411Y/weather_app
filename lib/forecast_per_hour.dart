import 'package:flutter/material.dart';
class ForecastPerHour extends StatelessWidget {
  final IconData iconData;
  final String time;
  final String temperature;
  const ForecastPerHour({super.key,
  required this.time,
  required this.iconData,
  required this.temperature
  });

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
                      children:  [
                        Text(time,
                        style: const TextStyle(fontSize: 16,
                        fontWeight: FontWeight.bold),
                        ),
                        Icon(iconData,
                        size: 32,),
                        const SizedBox(height: 8,),
                        Text(temperature),
                      ],
                    ),
                  ),
                ),
              );
  }
}