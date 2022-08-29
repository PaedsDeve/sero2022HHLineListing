import 'package:flutter/material.dart';
import 'package:sero2022hhlinelisting/DBProvider.dart';
import 'package:sero2022hhlinelisting/LoginCtr.dart';
import 'package:sero2022hhlinelisting/MainScreen.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Line Listing';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => new _MyStatefulWidgetState();
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register User'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            Database? db = await DBProvider.internal().db;
            db?.rawInsert(
                "INSERT INTO users (userid, passwd) VALUES('user1', 'user1')");

            Navigator.pop(context);
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
          ),
          Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'Sign in',
                style: TextStyle(fontSize: 20),
              )),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              controller: nameController,
              validator: (value) {
                if (value!.isEmpty)
                  return "Username required";
                else
                  return null;
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'User Name'),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
            child: TextFormField(
              obscureText: true,
              controller: passwordController,
              validator: (value) {
                if (value!.isEmpty)
                  return "Password required";
                else
                  return null;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child:
                ElevatedButton(child: const Text('Login'), onPressed: _login),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
            child: ElevatedButton(
              child: const Text('Cancel'),
              onPressed: _clearField,
            ),
          ),
          Row(
            children: <Widget>[
              const Text('Does not have account?'),
              TextButton(
                child: const Text(
                  '  Register',
                  style: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  //signup screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => new MainScreen()),
                  );
                },
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
      ),
    );
  }

  void _login() async {
    /*final allRows = await LoginCtr()
        .getLogin(nameController.value.text, passwordController.value.text);

    if (allRows.isEmpty)
      "";
    else
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => new MainScreen()));
    //allRows.forEach((row) => userArray.add(Users.fromMap(row)));*/
  }

  void _clearField() {
    nameController.clear();
    passwordController.clear();
    formKey.currentState!.reset();
  }

  void _submit(String val) {
    if (this.formKey.currentState!.validate())
      formKey.currentState!.save();
    else
      _login();
  }

  void _showSnackBar(String text) {
    scaffoldKey.currentState!
        .showSnackBar(new SnackBar(content: new Text(text)));
  }
}
