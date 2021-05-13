import 'package:flutter/material.dart';
import 'package:ui_design/ui/interestspage.dart';
import 'package:ui_design/main.dart';

class DrawerTap extends StatefulWidget {
  const DrawerTap({Key key}) : super(key: key);

  @override
  _DrawerTapState createState() => _DrawerTapState();
}

class _DrawerTapState extends State<DrawerTap> {
  get isSelected =>ListTile() ;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        SizedBox(
          height: 88.0,
          child: DrawerHeader(
            child: Text('JETNEWS',
              textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20,),),
            decoration: BoxDecoration(
              color: Colors.redAccent,
            ),
          ),
        ),
        Theme(
          data: ThemeData(
            highlightColor: Colors.redAccent,
          ),
          child: ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MainPage()));
            },
          ),
        ),
        Theme(
          data: ThemeData(
            highlightColor: Colors.redAccent,
          ),
          child: ListTile(
            leading: Icon(Icons.work),
            title: Text('Interests'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InterestsPage()),
              );
            },
          ),
        ),
      ],
    );
  }
}
