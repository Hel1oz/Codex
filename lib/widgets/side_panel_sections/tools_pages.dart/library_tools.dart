import 'package:flutter/material.dart';

class LibraryTools extends StatelessWidget{
  const LibraryTools({super.key});
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        ListTile(
          leading: Theme.of(context).colorScheme.brightness == Brightness.light ? Icon(Icons.add_sharp, color: Colors.black) : Icon(Icons.add_sharp, color: Colors.white),
          title: Text('Add Book', style: Theme.of(context).textTheme.titleSmall),
        ),
      ],
    );
  }
}