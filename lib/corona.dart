import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'weather.dart';
import 'news.dart';
import 'package:flutter/cupertino.dart';


import 'home.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:all_in_1/views/home1.dart';

class Corona extends StatefulWidget {
  @override
  _CoronaState createState() => _CoronaState();
}

class _CoronaState extends State<Corona> {
  var totcas;
  var totdea;
  var daicas;
  var daidea;
  var totrec;
  var dairec;
  var country='India';
  var countrytotcas;
  var countrytotdea;
  var countrydaicas;
  var countrydaidea;
  var countrytotrec;
  var countrydairec;
  var something;
  var location;

  double fontsize=14;
  Future corona()async{
    http.Response response = await http.get('https://api.covid19api.com/summary');
    var results= jsonDecode(response.body);
    setState(() {
      this.totcas=results['Global']['TotalConfirmed'];
      this.totdea=results['Global']['TotalDeaths'];
      this.daicas=results['Global']['NewConfirmed'];
      this.daidea=results['Global']['NewDeaths'];
      this.totrec=results['Global']['TotalRecovered'];
      this.dairec=results['Global']['NewRecovered'];
    });
  }
  @override
  void initState(){
    super.initState();
    this.corona();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        automaticallyImplyLeading: false,
        title: Center(child: Text("Corona Updates")),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black12,
            height: MediaQuery.of(context).size.height/3,
            width:MediaQuery.of(context).size.width ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("World",
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'BalooTamma2'
                ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Total cases:-",
                              style: TextStyle(
                                  fontSize: fontsize,
                                  fontFamily: 'BalooTamma2'
                              ),
                            ),
                            Text(totcas!=null?totcas.toString():"Loading...",
                              style: TextStyle(
                                  fontSize: fontsize,
                                  fontFamily: 'BalooTamma2'
                              ),),
                          ],
                        ),//total cases
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Total deaths:-",
                              style: TextStyle(
                                  fontSize: fontsize,
                                  fontFamily: 'BalooTamma2'
                              ),
                            ),
                            Text(totdea!=null?totdea.toString():"Loading...",
                              style: TextStyle(
                                  fontSize: fontsize,
                                  fontFamily: 'BalooTamma2'
                              ),),
                          ],
                        ),//total deaths
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Total Recovered:-",
                              style: TextStyle(
                                  fontSize: fontsize,
                                  fontFamily: 'BalooTamma2'
                              ),
                            ),
                            Text(totrec!=null?totrec.toString():"Loading...",
                              style: TextStyle(
                                  fontSize: fontsize,
                                  fontFamily: 'BalooTamma2'
                              ),),
                          ],
                        ),//total recovered
                      ],
                    ),//total
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Daily cases:-",
                              style: TextStyle(
                                  fontSize:fontsize,
                                  fontFamily: 'BalooTamma2'
                              ),
                            ),
                            Text(daicas!=null?daicas.toString():"Loading...",
                              style: TextStyle(
                                  fontSize: fontsize,
                                  fontFamily: 'BalooTamma2'
                              ),),
                          ],
                        ),//daily cases
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Daily Deaths:-",
                              style: TextStyle(
                                  fontSize: fontsize,
                                  fontFamily: 'BalooTamma2'
                              ),
                            ),
                            Text(daidea!=null?daidea.toString():"Loading...",
                              style: TextStyle(
                                  fontSize: fontsize,
                                  fontFamily: 'BalooTamma2'
                              ),),
                          ],
                        ),//daily deaths
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Daily Recovered:-",
                              style: TextStyle(
                                  fontSize: fontsize,
                                  fontFamily: 'BalooTamma2'
                              ),
                            ),
                            Text(dairec!=null?dairec.toString():"Loading...",
                              style: TextStyle(
                                  fontSize: fontsize,
                                  fontFamily: 'BalooTamma2'
                              ),),
                          ],
                        ),//daily recovered
                      ],
                    ),//daily
                  ],
                ),




              ],
            ),
          ),//World


          /*Center(
            child: TextFormField(
              decoration: InputDecoration(
                  labelText: 'Enter your country '
              ),
              onChanged: (String str){
                setState(() {
                  location=str;
                });
              },

            ),
          ),
          RaisedButton(
            color: Colors.black45,
            child: Text("Submit"),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder:(context)=>Country(location)));
            },
          ),*/





        ],
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
            FaIcon(FontAwesomeIcons.sun,size: 25,),
            FaIcon(FontAwesomeIcons.virus,size: 25,),


          ],
          index: 3,
          onTap: (index){
            if(index==2)
            {
              Navigator.push(context,
                  MaterialPageRoute(builder:(context)=>Weather()));
            }

            else if(index==1)
            {
              Navigator.push(context,
                  MaterialPageRoute(builder:(context)=>Home()));
            }
            else if(index==0)
            {
              Navigator.push(context,
                  MaterialPageRoute(builder:(context)=>HomePage()));
            }

          },
        ),
      ),
    );
  }
}


class Country extends StatefulWidget {
  String something;
  Country(this.something);
  @override
  _CountryState createState() => _CountryState(this.something);
}

class _CountryState extends State<Country> {
  String something;
  _CountryState(this.something);
  var countrytotcas;
  var countrytotdea;
  var countrydaicas;
  var countrydaidea;
  var countrytotrec;
  var countrydairec;
  var country="India";
  double fontsize=18;
  Future corona()async {
    http.Response response = await http.get('https://api.covid19api.com/summary');
    var results = jsonDecode(response.body);
    setState(() {
      this.countrytotcas=results['Countries'][0]['TotalConfirmed'];
      this.countrytotdea=results[country]['TotalDeaths'];
      this.countrytotrec=results[country]['TotalRecovered'];
      this.countrydaicas=results[country]['NewConfirmed'];
      this.countrydaidea=results[country]['NewDeaths'];
      this.countrydairec=results[country]['NewRecovered'];
    });

  }
  @override
  void initState(){
    super.initState();
    this.corona();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        automaticallyImplyLeading: false,
        title: Center(child: Text("Corona Updates")),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.black12,
            height: MediaQuery.of(context).size.height/3,
            width:MediaQuery.of(context).size.width ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(something,
                  style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'BalooTamma2'
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Total cases:-",
                              style: TextStyle(
                                  fontSize: fontsize,
                                  fontFamily: 'BalooTamma2'
                              ),
                            ),
                            Text(countrytotcas!=null?countrytotcas.toString():"Loading...",
                              style: TextStyle(
                                  fontSize: fontsize,
                                  fontFamily: 'BalooTamma2'
                              ),),
                          ],
                        ),//total cases
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Total deaths:-",
                              style: TextStyle(
                                  fontSize: fontsize,
                                  fontFamily: 'BalooTamma2'
                              ),
                            ),
                            Text(countrytotdea!=null?countrytotdea.toString():"Loading...",
                              style: TextStyle(
                                  fontSize: fontsize,
                                  fontFamily: 'BalooTamma2'
                              ),),
                          ],
                        ),//total deaths
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Total Recovered:-",
                              style: TextStyle(
                                  fontSize: fontsize,
                                  fontFamily: 'BalooTamma2'
                              ),
                            ),
                            Text(countrytotrec!=null?countrytotrec.toString():"Loading...",
                              style: TextStyle(
                                  fontSize: fontsize,
                                  fontFamily: 'BalooTamma2'
                              ),),
                          ],
                        ),//total recovered
                      ],
                    ),//total
                    Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Daily cases:-",
                              style: TextStyle(
                                  fontSize:fontsize,
                                  fontFamily: 'BalooTamma2'
                              ),
                            ),
                            Text(countrydaicas!=null?countrydaicas.toString():"Loading...",
                              style: TextStyle(
                                  fontSize: fontsize,
                                  fontFamily: 'BalooTamma2'
                              ),),
                          ],
                        ),//daily cases
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Daily Deaths:-",
                              style: TextStyle(
                                  fontSize: fontsize,
                                  fontFamily: 'BalooTamma2'
                              ),
                            ),
                            Text(countrydaidea!=null?countrydaidea.toString():"Loading...",
                              style: TextStyle(
                                  fontSize: fontsize,
                                  fontFamily: 'BalooTamma2'
                              ),),
                          ],
                        ),//daily deaths
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Daily Recovered:-",
                              style: TextStyle(
                                  fontSize: fontsize,
                                  fontFamily: 'BalooTamma2'
                              ),
                            ),
                            Text(countrydairec!=null?countrydairec.toString():"Loading...",
                              style: TextStyle(
                                  fontSize: fontsize,
                                  fontFamily: 'BalooTamma2'
                              ),),
                          ],
                        ),//daily recovered
                      ],
                    ),//daily
                  ],
                ),




              ],
            ),
          ),//World









        ],
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
            FaIcon(FontAwesomeIcons.sun,size: 25,),
            FaIcon(FontAwesomeIcons.virus,size: 25,),


          ],
          index: 3,
          onTap: (index){
            if(index==2)
            {
              Navigator.push(context,
                  MaterialPageRoute(builder:(context)=>Weather()));
            }

            else if(index==1)
            {
              Navigator.push(context,
                  MaterialPageRoute(builder:(context)=>News()));
            }
            else if(index==0)
            {
              Navigator.push(context,
                  MaterialPageRoute(builder:(context)=>HomePage()));
            }

          },
        ),
      ),
    );
  }
}
