

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';

import 'additional_info_item.dart';
import 'forecast_per_hour.dart';
import 'package:http/http.dart' as http;
class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});
  
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
double temp = 0;
 
  
 Future getCurrentWeather() async{
  try{
   
    final res = await  http.get(Uri.parse('https://api.openweathermap.org/data/2.5/forecast?lat=44.34&lon=10.99&appid=452c3d99f10c78c5a9dce665ad125518'
  )
  );
 
 print("hello");
 
 final data = jsonDecode(res.body);
 if(data['cod']!='200'){
 throw "An unexpected error occured";
 }
 
  
    
    return data;
   
  


  }
  catch(e){
    throw e.toString();
  }
  }

 

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
      body: FutureBuilder(
        future: getCurrentWeather(),
        builder:(context,snapshot) {
           print(snapshot);
          print(snapshot.runtimeType);
          print(temp);
          
          if(snapshot.connectionState==ConnectionState.waiting){
            return  const Center(child:  CircularProgressIndicator());
          }
          if(snapshot.hasError){
            return Text(snapshot.error.toString());
          }
          final data = snapshot.data!;
          
          temp = data["list"][0]["main"]["temp"];
          final weather = data['list'][0]['weather'][0]['main'];
          final currentPressure = data['list'][0]['main']["pressure"].toString();
          final currentWindSpeed = data['list'][0]['wind']['speed'].toString();
          final currentHumidity = data['list'][0]['main']['humidity'].toString();
         
           
          return Padding(
          padding:  const EdgeInsets.all(16.0),
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
                    padding:   const EdgeInsets.all(16.0),
                    child: Column(children: [
                     Text("$temp k",style:
                      const TextStyle(fontSize: 32,
                      fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8,),
                      
                       Icon(weather=="Clouds"? Icons.cloud:Icons.sunny,
                      size: 64,),
                      const SizedBox(height: 8,),
                      Text(weather,style: const TextStyle(fontSize: 20),)
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
          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //    child: Row(
          //     children:  [
          //       for(int i=0;i<data['list'].length;i++)
          //     ForecastPerHour(time:data['list'][i]['dt_txt'].toString(),
          //     iconData:data['list'][i]['weather'][0]['main']=='Clouds'? Icons.dark_mode_rounded:Icons.sunny,
          //     temperature: data['list'][i]['main']['temp'].toString(),),
             
              
              
               
          //     ],
          //    ),
          //  ),
           SizedBox(
            height: 150,
             child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data['list'].length,
              itemBuilder:(context, i) {
              
              return  ForecastPerHour(time:data['list'][i]['dt_txt'].toString(),
               iconData:data['list'][i]['weather'][0]['main']=='Clouds'? Icons.dark_mode_rounded:Icons.sunny,
                temperature: data['list'][i]['main']['temp'].toString(),);
               }
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
          children:  [
            AdditionalInfoItem(icon: Icons.water_drop,label: "Humidity",value:currentHumidity),
            AdditionalInfoItem(icon: Icons.air,label: "Wind Speed",value: currentWindSpeed),
            AdditionalInfoItem(icon: Icons.beach_access,label: "Pressure",value: currentPressure)
           
        
          ],
         )
          ]),
        );
        },
      ),
    );
  }
}

