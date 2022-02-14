import 'package:flutter/material.dart';
import 'package:sqliteschool/homepage.dart';

class ScrollableTab extends StatefulWidget {
  static const routeName = '/ScrollableTab';
  @override
  _ScrollableTabState createState() => _ScrollableTabState();
}

class _ScrollableTabState extends State<ScrollableTab> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Smiple Tab Demo",
              style: TextStyle(color: Colors.black)),
          bottom: TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.home, color: Colors.black),
                    Text('Cities', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.person_pin, color: Colors.black),
                    Text('Karachi', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.save_alt, color: Colors.black),
                    Text('Classes', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.favorite_border, color: Colors.black),
                    Text('batch', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.info_outline, color: Colors.black),
                    Text('About', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.chat, color: Colors.black),
                    Text('Chat', style: TextStyle(color: Colors.black)),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: const <Widget>[
                    Icon(Icons.settings, color: Colors.black),
                    Text('Settings', style: TextStyle(color: Colors.black)),
                  ],
                ),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
              child: Center(
                child: HomePage(),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  "Profile",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  "Saved",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  "Favorite",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  "About",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  "Chat",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Container(
              child: Center(
                child: Text(
                  "Settings",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}