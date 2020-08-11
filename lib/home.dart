import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'weather.dart';
import 'news.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Center(
            child: Text("Welcome",
            style: TextStyle(fontFamily: 'BalooTamma2'),)
        ),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(24),
            child: Text("This app will provide you with all the basic information you will need",
              style: TextStyle(fontFamily: 'BalooTamma2',
              fontSize: 20),),
          ),
          Container(
            padding: EdgeInsets.all(24),
            child: Text("For now only weather and news are shown",
              style: TextStyle(fontFamily: 'BalooTamma2',
                  fontSize: 20),
            ),
          ),

          Container(
            padding: EdgeInsets.all(24),
            child: Text("More content will be added later",
              style: TextStyle(fontFamily: 'BalooTamma2',
                  fontSize: 20),
            ),
          ),
          Container(
            padding: EdgeInsets.all(24),

            child: Text("Stay Tuned!!",
              style: TextStyle(fontFamily: 'BalooTamma2',
                  fontSize: 20),
            ),
          ),

        ],
      ) ,

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
            FaIcon(FontAwesomeIcons.sun,size: 25,),
            FaIcon(FontAwesomeIcons.newspaper,size: 25,),

          ],
          onTap: (index){
            if(index==0)
              {
                Navigator.push(context,
                    MaterialPageRoute(builder:(context)=>Weather()));
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
