import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'weather.dart';

import 'package:flutter/cupertino.dart';

import 'sidebar.dart';
import 'corona.dart';
import 'views/home1.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String location;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      drawer: NavDrawer(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black45,
        title: Center(
            child: Text("Home",
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
            FaIcon(FontAwesomeIcons.newspaper,size: 25,),
            FaIcon(FontAwesomeIcons.sun,size: 25,),
            FaIcon(FontAwesomeIcons.virus,size: 25,),


          ],
          index: 0,
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
            else if(index==3)
            {
              Navigator.push(context,
                  MaterialPageRoute(builder:(context)=>Corona()));
            }

          },
        ),
      ),
    );
  }
}
