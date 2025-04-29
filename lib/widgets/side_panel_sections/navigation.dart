//packages

import 'package:flutter/material.dart';

class Navigation extends StatelessWidget {

  const Navigation({super.key});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    /*
        set up a container, it should shrink to its child widget, so set column's mainaxissize to minimum, 
        now for the header. How? Just a container? with some padding? Or maybe another list tile and I'll
        just use the title parameter
    */
    return Container(
      color: Colors.amber,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          ListTile(leading: Text('Leading'), title: Text('test')),
          ListTile(leading: Text('Leading'), title: Text('test')),
          ListTile(leading: Text('Leading'), title: Text('test')),
          SizedBox(height: 50),
          ListTile(leading: Text('Leading'), title: Text('test'))
        ],
      )
    );
  }
}
