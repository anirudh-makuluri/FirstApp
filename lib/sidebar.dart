import 'package:flutter/material.dart';



import 'package:flutter/cupertino.dart';



class NavDrawer extends StatefulWidget {
  @override
  _NavDrawerState createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Text("About"),
    );
  }
}
