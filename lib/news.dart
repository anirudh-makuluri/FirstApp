import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'weather.dart';
import 'home.dart';
import 'corona.dart';


class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  News a = new News();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar:new AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black45,
        title: Center(
            child: Text("News",
              style: TextStyle(fontFamily: 'BalooTamma2'),)
        ),
      ),
      body:Text("Hello"),



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
          index: 1,
          onTap: (index){
            if(index==0)
            {
              Navigator.push(context,
                  MaterialPageRoute(builder:(context)=>HomePage()));
            }

            else if(index==2)
            {
              Navigator.push(context,
                  MaterialPageRoute(builder:(context)=>Weather()));
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
