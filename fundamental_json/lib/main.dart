import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fundamental_json/model/sample.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // fake method for simulation
  Future _loadJsonSample() async {
    String jsonString = await rootBundle.loadString('asset/sample.json');
    // Procces Mapping Data
    final jsonData = jsonDecode(jsonString);
    Sample sample = Sample.fromJson(jsonData);
    setState(() {
      result = sample;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fundamental Parsing Json',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('fundamental Parsing Json'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  _loadJsonSample();
                },
                child: const Text('Read JSON Data'),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  'no data',
                  style: TextStyle(
                    fontSize: 22.0,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
