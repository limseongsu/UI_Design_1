import 'package:flutter/material.dart';
import 'package:ui_design/body/mainslider.dart';
import 'package:ui_design/body/maintile.dart';
import 'package:ui_design/body/maintoptile.dart';
import 'package:ui_design/models/fake_data.dart';
import 'package:ui_design/models/provider.dart';
import 'package:ui_design/ui/drawertap.dart';
import 'package:provider/provider.dart';



void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ThisProvider())],
    child: MyApp(),
  ));
}
class MyApp extends StatelessWidget {
  List<Result> news;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jetnews',
      home: MultiProvider(

          providers: [ChangeNotifierProvider(create: (_) => ThisProvider())],
          child: MainPage()),
    );
  }
}

class MainPage extends StatefulWidget {


  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    super.initState();

    context.read<ThisProvider>().fetchData().then((jetNewsResult) {
      setState(() {
        context.read<ThisProvider>().publication();

        for (int i = 0; i < jetNewsResult.result.length; i++) {
          context
              .read<ThisProvider>()
              .jetNews
              .add(jetNewsResult.result[i]);
        }
        context.read<ThisProvider>().loading();
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          MainTopTile(context.read<ThisProvider>().jetNews),
          MainTile(context.read<ThisProvider>().jetNews),
          MainSlider(context.read<ThisProvider>().jetNews),
          MainTile(context.read<ThisProvider>().jetNews),
          MainTile(context.read<ThisProvider>().jetNews),
          MainTile(context.read<ThisProvider>().jetNews),
        ],
      ),
    );
  }
}