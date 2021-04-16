import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SearchWidget.dart';
import 'drawer.dart';

class MainPage extends StatelessWidget {

  String username;

  MainPage(String username){
    this.username = username;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MainPageWidget(username)
    );
  }

}

class MainPageWidget extends StatefulWidget{
  String username;

  MainPageWidget(String username){
    this.username = username;
  }

  @override
  _MainPageWidget createState() => _MainPageWidget(username);
}

class _MainPageWidget extends State<MainPageWidget>{
  String state,username;

  _MainPageWidget(String username){
    this.username = username;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      drawer: Drawer(
        child: SideDrawer(username),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SearchWidget(
                onCountChanged:(String val){
                  setState(() {
                    state = val;
                    print(state);
                  });
                }
              ),
            ],
          )
        ],
      ),
    );
  }

}