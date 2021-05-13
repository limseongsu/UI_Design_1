import 'package:flutter/material.dart';
import 'package:ui_design/ui/drawertap.dart';


class InterestsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialApp(
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.redAccent,
              bottom: TabBar(
                tabs: [
                  Tab(text: 'Topics'),
                  Tab(text: 'People',),
                  Tab(text: 'Publications'),
                ],
              ),
              title: Text('Interests'),
            ),
            drawer: Drawer(
              child: DrawerTap(),
            ),
            body: TabBarView(
              children: [
                FirstScreen(),
                SecondScreen(),
                ThirdScreen()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Center(
                child:
                Text('First Activity Screen',
                  style: TextStyle(fontSize: 21),)
            )
        )
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Center(
                child:
                Text('Second Activity Screen',
                  style: TextStyle(fontSize: 21),)
            )
        )
    );
  }
}

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Center(
                child:
                Text('Third Activity Screen',
                  style: TextStyle(fontSize: 21),)
            )
        )
    );
  }
}