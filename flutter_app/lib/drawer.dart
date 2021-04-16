import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'SignUp.dart';
import 'MainPage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'UserPage.dart';

class SideDrawer extends StatefulWidget{
  String username;

  SideDrawer(String username){
    this.username = username;
  }

  @override
  _SideDrawer createState() => _SideDrawer(username);
}

class _SideDrawer extends State<SideDrawer>{

  String username;

  _SideDrawer(String username){
    this.username = username;
  }

  exit(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _createHeader(),
        Padding(
          child: _createTile(Icon(Icons.home), "Home",context),
          padding:EdgeInsets.all(5),
        ),
        Padding(
        child: _createTile(Icon(Icons.person),"Profile",context),
        padding:EdgeInsets.all(5),
        ),
        Padding(
          child: _createTile(Icon(Icons.shopping_cart),"Cart",context),
          padding:EdgeInsets.all(5),
        ),
        Padding(
          child: _createTile(Icon(Icons.logout),"Exit",context),
          padding: EdgeInsets.all(5),
        ),
      ],
    );
  }

  Widget _createHeader(){
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient:LinearGradient(colors: <Color>[
          Color(0xFFF44336),
          Color(0xFFFFA726)
        ])
      ),
      child:Container(
        child:
          Column(
            children: [
              Padding(
                  padding:EdgeInsets.only(top:15),
                  child:Material(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  child: Image.asset("images/pie.png",width:100,height: 100,),
                )
              )

            ],
          )
      )
    );
  }

  Widget _createTile(Icon i1,String text,BuildContext context){
    return Padding(
        child:
          ListTile(
            trailing: i1,
            title: Text(text,
              style: TextStyle(
                fontSize: 16,
                fontFamily: GoogleFonts.openSans().fontFamily,
              ),
            ),
            onTap: (){
              if(text.compareTo("Exit") == 0){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
              }
              else if(text.compareTo("Home") == 0){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage(username)));
              }
              else if(text.compareTo("Profile") == 0){
                Navigator.push(context,MaterialPageRoute(builder: (context) => UserPage(context,username)));
              }
            },
          ),
        padding: EdgeInsets.all(10),
    );
  }

}