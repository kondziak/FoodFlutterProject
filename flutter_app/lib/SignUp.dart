import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:email_validator/email_validator.dart';
import 'main.dart';

class SignUpWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SignUp(),
    );
  }

}

class SignUp extends StatefulWidget{
  @override
  _SignUp createState()=> _SignUp();
}

class _SignUp extends State<SignUp>{

  final keyForm = GlobalKey<FormState>();
  TextEditingController usernameCon = TextEditingController(),
      passwordCon= TextEditingController(),verifyCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Form(
        key: keyForm,
        child:ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                nameInput(),
                emailInput(),
                passwordButton(passwordCon),
                passwordButton(verifyCon),
                signUpButton(context),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget nameInput(){
    return(Padding(
      padding: EdgeInsets.only(left: 15,right: 15,top:15),
      child: TextFormField(
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        validator: (name){
          if(name.isEmpty){
            return "Enter your username";
          }
          return null;
        },
        controller: usernameCon,
        showCursor: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none
              )
          ),
          filled: true,
          prefixIcon: Icon(
            Icons.person,
            size: 22,
            color: Color(0xFF666666),
          ),
          fillColor: Color(0xFFF2F3F5),
          hintStyle: TextStyle(
              color: Color(0xFF666666),
              fontSize: 17),
          hintText: "Enter your username",
        ),
      ),
    )
    );
  }




  Widget phoneInput(){
    return Padding(
      padding: EdgeInsets.only(left: 15,right: 15,top:15),
      child: TextFormField(
        validator: (phone){
          Pattern pattern = r'^(\\d{3}[- .]?){2}\\d{4}$';
          RegExp reg = RegExp(pattern);
          if(reg.hasMatch(phone) == false){
            return "Invalid phone number";
          }
          return null;
        },
        keyboardType: TextInputType.phone,
        textInputAction: TextInputAction.next,
        showCursor: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none
              )
          ),
          filled: true,
          prefixIcon: Icon(
            Icons.phone_android,
            size: 22,
            color: Color(0xFF666666),
          ),
          fillColor: Color(0xFFF2F3F5),
          hintStyle: TextStyle(
              color: Color(0xFF666666),
              fontSize: 17),
          hintText: "Enter your phone number",
        ),
      ),
    );
  }

  Widget emailInput(){
    return Padding(
      padding: EdgeInsets.only(left: 15,right: 15,top:15),
      child: TextFormField(
        validator: (email){
          final bool isValid = EmailValidator.validate(email);
          if(isValid == false){
            return "Invalid email format";
          }
          return null;
        },
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        showCursor: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none
              )
          ),
          filled: true,
          prefixIcon: Icon(
            Icons.email,
            size: 22,
            color: Color(0xFF666666),
          ),
          fillColor: Color(0xFFF2F3F5),
          hintStyle: TextStyle(
              color: Color(0xFF666666),
              fontSize: 17),
          hintText: "Enter your email",
        ),
      ),
    );
  }

  Widget passwordButton(TextEditingController control){
    return Padding(
      padding: EdgeInsets.only(left:15,right:15,top:15),
      child:TextFormField(
        validator: (password){
          if(password.isEmpty || password.length < 6){
            return "Password should have at least 6 characters";
          };
          if(passwordCon.value.text.compareTo(verifyCon.value.text) != 0){
            return "Passwords don't match";
          }
          return null;
        },
        controller: control,
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        showCursor: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none
              )
          ),
          filled: true,
          prefixIcon: Icon(
            Icons.lock,
            size: 22,
            color: Color(0xFF666666),
          ),
          fillColor: Color(0xFFF2F3F5),
          hintStyle: TextStyle(
              color: Color(0xFF666666),
              fontSize: 17),
          hintText: "Enter your password",
        ),
      ),
    );
  }

  Widget signUpButton(BuildContext context){
    return Padding(
      padding: EdgeInsets.all(15),
      child:Container(
        width:double.infinity,
        decoration: new BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(0xFFF44336)
              ),
              BoxShadow(
                  color: Color(0xFFFFA726)
              )
            ],
            gradient: new LinearGradient(
              colors:[Color(0xFFF44336), Color(0xFFFFA726)],
              begin: const FractionalOffset(0.2, 0.2),
              end: const FractionalOffset(1.0, 1.0),
              stops:[0.0,1.0],
              tileMode: TileMode.clamp,
            )
        ),
        child: MaterialButton(
            highlightColor: Colors.transparent,
            splashColor: Color(0xFFf7418c),
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 42.0),
                child:Text(
                  "SIGN UP",
                  style: TextStyle(
                    color:Colors.white,
                    fontSize:25.0,
                  ),
                )
            ),
            onPressed: ()=>
            {setState(() {
              if (keyForm.currentState.validate())
                goToHome(this.context);
            }),
            }),
      ),
    );
  }

  Future <void> goToHome(BuildContext context) async{
    await Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }
}

