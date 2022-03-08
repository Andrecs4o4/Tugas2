import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSucces = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: Column(


          children: [
            Image.asset("images/flutter-logo.jpeg"),
            _username(),
            _password(),
            _loginButton(context),

          ],
        ),
      ),
    );
  }

  Widget _username() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          username = value;
        },
        decoration: InputDecoration(
            hintText: 'Username',
            contentPadding: const EdgeInsets.all(8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.blue),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: (isLoginSucces) ? Colors.blue : Colors.red),
            )),
      ),
    );
  }

  Widget _password() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: TextFormField(
        enabled: true,
        onChanged: (value) {
          password = value;
        },
        obscureText: true,
        decoration:  InputDecoration(
            hintText: 'Password',
            contentPadding: const EdgeInsets.all(8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(color: Colors.blue),
            ),enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      borderSide: BorderSide(color: (isLoginSucces) ? Colors.blue : Colors.red),
    )),

      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: (isLoginSucces) ? Colors.blue : Colors.red,
          onPrimary: Colors.white,
        ),
        onPressed: () {
          String text = "";
          if (username == "andre" && password == "123") {
            setState(() {
              text = "Login Success";
              isLoginSucces = true;
            });
          } else {
            text = "Login Failed";
            setState(() {
              isLoginSucces = false;
            });
          }
          SnackBar snackBar = SnackBar(
            content: Text(text),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text('Login Button'),
      ),
    );
  }
}
