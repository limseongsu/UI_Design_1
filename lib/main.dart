import 'package:flutter/material.dart';
import 'package:ui_design/body/mainslider.dart';
import 'package:ui_design/body/maintile.dart';
import 'package:ui_design/ui/drawertap.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jetnews',
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {


  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // main 화면 appbar
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text('JETNEWS'),
      ),
      drawer: Drawer(
        child: DrawerTap(),
      ),
      //main Home body 만드는 곳 시작
      body: ListView(
        children: [
          MainTile(),
          MainTile(),
          MainSlider(),
          MainTile(),
          MainTile(),
          MainTile(),
        ],
      ),
    );
  }
}
