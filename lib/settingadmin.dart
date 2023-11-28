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
  TextEditingController adminIdController = TextEditingController();
  TextEditingController adminNameController = TextEditingController();
  TextEditingController adminUserNameController = TextEditingController();
  TextEditingController adminEmailController = TextEditingController();
  TextEditingController adminPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Setting'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: adminNameController,
              decoration: InputDecoration(
                labelText: 'Admin Name',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: adminEmailController,
              decoration: InputDecoration(
                labelText: 'Admin Username',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: adminPasswordController,
              decoration: InputDecoration(
                labelText: 'Admin Password',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: adminEmailController,
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