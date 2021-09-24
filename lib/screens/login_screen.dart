import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login/screens/doc_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  bool rememberMe = false;

  Widget _textField(String str, Icon icon, bool obscure) {
    return TextField(
        onChanged: (value) {
          str = value;
        },
        style: TextStyle(color: Colors.white),
        obscureText: obscure,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: icon,
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          hintText: 'Enter your $str',
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3E92DC),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _textField(
                "email",
                Icon(
                  Icons.email,
                  color: Colors.white,
                ),
                false),
            SizedBox(
              height: 20.0,
            ),
            _textField(
                "password",
                Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                true),
            SizedBox(
              height: 5.0,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () => print("a"),
                child: Text("Forgot password"),
                textColor: Colors.white,
              ),
            ),
            Row(
              children: <Widget>[
                Theme(
                  data: ThemeData(
                    unselectedWidgetColor: Colors.white,
                  ),
                  child: Checkbox(
                      checkColor: Colors.blue,
                      activeColor: Colors.white,
                      value: rememberMe,
                      onChanged: (value) {
                        setState(() {
                          rememberMe = value;
                        });
                      }),
                ),
                Text(
                  "Remember me",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            ButtonTheme(
              height: 45.0,
              child: RaisedButton(
                  color: Colors.white,
                  shape: new RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 17.0, color: Color(0xFF3E92DC)),
                  ),
                  onPressed: () {
                    if (false) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return DocScreen();
                      }));
                    } else if (true) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Error"),
                              content: Text("Wrong password or email"),
                            );
                          });
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
