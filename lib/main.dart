import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Athlete {
  final String name;
  final String level;

  Athlete({required this.name, required this.level});
}

class MyApp extends StatelessWidget {
  final List<Athlete> athletes = [
    Athlete(name: 'Abhishek', level: 'Basic'),
    Athlete(name: 'Tarun', level: 'Intermediate'),
    Athlete(name: 'Mohan', level: 'Advanced'),
    Athlete(name: 'Mohan', level: 'Intermediate'),
    Athlete(name: 'Raja', level: 'Basic'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          scrollDirection: Axis.vertical,
          children: _buildLevels(),
        ),
      ),
    );
  }

  List<Widget> _buildLevels() {
    List<Widget> levelWidgets = [];

    Set<String> uniqueLevels = athletes.map((athlete) => athlete.level).toSet();

    for (String level in uniqueLevels) {
      List<Athlete> athletesByLevel =
      athletes.where((athlete) => athlete.level == level).toList();

      levelWidgets.add(
        Card(
          elevation: 3.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Level: $level',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: athletesByLevel
                      .map((athlete) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Name: ${athlete.name}'),
                  ))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return levelWidgets;
  }
}
