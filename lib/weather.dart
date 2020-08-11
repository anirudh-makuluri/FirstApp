import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'home.dart';
import 'news.dart';


class Weather extends StatefulWidget {
  @override
  _WeatherState createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  String location;



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter your city'
              ),
              onChanged: (String str){
                setState(() {
                  location=str;
                });
              },
            ),
          ),

          RaisedButton(
            child: Text("Submit"),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>SecondPage(location)));
            },
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatefulWidget {
  String something;
  SecondPage(this.something);
  @override
  State<StatefulWidget> createState() {
    return SecondPageState(this.something);
  }
}
class SecondPageState extends State<SecondPage> {
  String something;
  SecondPageState(this.something);
  var temp;
  var description;
  var currently;
  var humidity;
  var windspeed;

  Future weather()async{
    http.Response response = await http.get('http://api.openweathermap.org/data/2.5/weather?q=$something&units=imperial&appid=73d2cc3429c1136bdbf5b75bfec3e44f');
    var results= jsonDecode(response.body);
    setState(() {
      this.temp=results['main']['temp'];
      this.description=results['weather'][0]['description'];
      this.currently=results['weather'][0]['main'];
      this.humidity=results['main']['humidity'];
      this.windspeed=results['wind']['speed'];
    });

  }
  @override
  void initState(){
    super.initState();
    this.weather();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text("Weather at $something"),
      ),
      body:Column(

        children: [
          Container(
            height: MediaQuery.of(context).size.height/3,
            width:MediaQuery.of(context).size.width ,
            color: Colors.blueGrey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    temp!=null?temp.toString()+"\u00B0 F":"Loading...",
                  style: TextStyle(
                    fontFamily: 'BalooTamma2',
                    fontSize: 45,
                  ),
                ),
                Text(currently!=null?currently.toString():"Loading...",
                  style: TextStyle(
                    fontFamily: 'BalooTamma2',
                    fontSize: 45,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.thermometerHalf),
                  title: Text("Temperature"),
                  trailing: Text( temp!=null?temp.toString()+"\u00B0 F":"Loading..."),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.cloud),
                  title: Text("Description"),
                  trailing: Text(description!=null?description.toString():"Loading..."),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.sun),
                  title: Text("Humidity"),
                  trailing: Text(humidity!=null? humidity.toString():"Loading..."),
                ),
                ListTile(
                  leading: FaIcon(FontAwesomeIcons.wind),
                  title: Text("Windspeed"),
                  trailing: Text(windspeed!=null? windspeed.toString():"Loading..."),
                ),

              ],
            ),
          ),


        ],
      ),
     floatingActionButton: FloatingActionButton(
       child: Text("Change city?"),
       onPressed: (){
         Navigator.push(context,
             MaterialPageRoute(builder: (context)=>Weather()));
       },
     ),

      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top:Radius.circular(32)
        ),
        child: CurvedNavigationBar(
          animationDuration: Duration(milliseconds: 500),
          animationCurve: Curves.easeInOutQuad,
          backgroundColor: Colors.blueGrey,
          color: Colors.black45,
          buttonBackgroundColor: Colors.blueGrey,
          height: 60,
          items: [
            FaIcon(FontAwesomeIcons.home,size: 25,),
            FaIcon(FontAwesomeIcons.newspaper,size: 25,),

          ],
          onTap: (index){
            if(index==0)
            {
              Navigator.push(context,
                  MaterialPageRoute(builder:(context)=>HomePage()));
            }

            else if(index==1)
            {
              Navigator.push(context,
                  MaterialPageRoute(builder:(context)=>News()));
            }
          },
        ),
      ),
    );
  }
}
