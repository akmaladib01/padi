import 'package:flutter/material.dart';

class MainCanelLevel extends StatelessWidget {
  // 1) IN receiver, add a variable where the item will be stored
  final List<String> _dropdownItems = ['Option 1', 'Option 2', 'Option 3'];
  String _selectedItem = 'Option 1'; // Default selected item

  //Map <String,dynamic> item;
  // 2) Create constructor of the receiver, ClassName({})
  //DetailPage({required this.item});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Real Time Water Level Monitoring System"),),
        body:Center(
          child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget> [
              ElevatedButton(
               onPressed: () {
                print('Button working');
                  },
                child: Text('MyCanelLevel',
                style: TextStyle(fontSize: 18),
              ),
          ),
             Text('MY CANEL LIST',
               style: TextStyle(fontSize: 18),
             ),
              DropdownButton<String>(
              value: _selectedItem,
               items: _dropdownItems.map((String item) {
                return DropdownMenuItem<String>(
                 value: item,
                  child: Text(item),
                  );
                  }).toList(),
                  onChanged: (String? newValue) {
                    if (newValue != null) {
                      // Update the selected item when a new value is selected
                      _selectedItem = newValue;
                      print('Selected: $_selectedItem');
                    }
                  }
             ),
             SizedBox(height: 20),
             Text(
                   'DEVICES: $_selectedItem',
                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
            Text(
               'SCALE: GOOD WATER LEVEL',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            Text(
                 'WATER LEVEL: 2.9 METER',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
    ]),
    ),
    );
  }
}