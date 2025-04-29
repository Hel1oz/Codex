//packages

import 'package:flutter/material.dart';

class Settings extends StatelessWidget {

  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.amber,
      child: ListTile(leading: Text('Leading'), title: Text('testing'),)
    );
  }
}