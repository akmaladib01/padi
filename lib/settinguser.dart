import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController userIdController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController userUserNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users Setting'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: userNameController,
              decoration: InputDecoration(
                labelText: 'Admin Name',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: userEmailController,
              decoration: InputDecoration(
                labelText: 'Admin Username',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: userPasswordController,
              decoration: InputDecoration(
                labelText: 'Admin Password',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: userEmailController,
              decoration: InputDecoration(
                labelText: 'Admin Email',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Call API or update the local database with the provided information.
              },
              child: Text('Update Now'),
            ),
          ],
        ),
      ),
    );
  }
}