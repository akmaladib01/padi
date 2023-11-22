import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {

  Dashboard({Key? key}) : super(key: key);

  Widget itemDashboard(String title, IconData iconData, Color background, BuildContext context, Widget Function(BuildContext) routeBuilder) =>
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: routeBuilder),
          );
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 5),
                    color: Theme.of(context).primaryColor.withOpacity(.2),
                    spreadRadius: 2,
                    blurRadius: 5)
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: background,
                    shape: BoxShape.circle),
                child: Icon(iconData, color: Colors.white),
              ),
              const SizedBox(height: 9),
              Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
              )
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.blue[900],
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                )),
            child: Column(
              children: [
                const SizedBox(height: 10),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  title: Text("SawahCek",
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(color: Colors.white), textAlign: TextAlign.center,),
                  subtitle: Text(
                    "Real Time Monitoring Water Level System",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white54,
                    ), textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            height: 900,
            child: Container(

              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 4),
              decoration: BoxDecoration(
                  color: Colors.blue[700],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70),
                    topRight: Radius.circular(70),
                    bottomLeft: Radius.circular(70),
                    bottomRight: Radius.circular(70),
                  )
              ),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 4,
                crossAxisSpacing: 40,
                mainAxisSpacing: 30,
                children: [
                  itemDashboard('Notification', CupertinoIcons.mail, Colors.blueAccent, context, (context) => Notif()),
                  itemDashboard('WaterLevel', CupertinoIcons.alarm, Colors.lightBlue, context, (context) => WaterLevel()),
                  itemDashboard('E-Report', CupertinoIcons.thermometer, Colors.blueGrey, context, (context) => EReport()),
                  itemDashboard('My Settings', CupertinoIcons.settings_solid, Colors.blue, context, (context) => MySettings()),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          exit(0);
        },
        child: const Icon(Icons.exit_to_app),
      ),
    );
  }
}

class Notif extends StatelessWidget {
  const Notif({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Notification'),
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Coming Soon'),
        ),
      ),
    );
  }
}

class WaterLevel extends StatelessWidget {
  const WaterLevel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Water Level'),
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Coming Soon'),
        ),
      ),
    );
  }
}

class EReport extends StatelessWidget {
  const EReport({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('E-Report'),
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Coming Soon!'),
        ),
      ),
    );
  }
}

class MySettings extends StatelessWidget {
  const MySettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('My Settings'),
      ),
      child: Center(
        child: CupertinoButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Coming Soon!'),
        ),
      ),
    );
  }
}
