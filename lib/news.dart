import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'weather.dart';
import 'home.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Center(
            child: Text("News",
              style: TextStyle(fontFamily: 'BalooTamma2'),)
        ),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [



          Container(
            padding: EdgeInsets.all(24),
            child: Text("Almost done!!",
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
            FaIcon(FontAwesomeIcons.home,size: 25,),
            FaIcon(FontAwesomeIcons.sun,size: 25,),

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
                  MaterialPageRoute(builder:(context)=>Weather()));
            }
          },
        ),
      ),
    );
  }
}
