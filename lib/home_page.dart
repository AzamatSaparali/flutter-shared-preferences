import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_pref/models/list_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_pref/notes_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String appTitle = 'Shared Prefs';
  final listInfoKey = 'listInfo';
  final _noteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.all(15),
            color: Colors.grey[200],
            child: TextField(
              controller: _noteController,
              decoration: const InputDecoration(hintText: 'enter notes'),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                setNotesData(_noteController.text);
              });
            },
            child: const Text(
              'Add note',
              style: TextStyle(fontSize: 25.0),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotesList(),
                ),
              );
            },
            child: const Text(
              'go to notes list',
              style: TextStyle(fontSize: 25.0),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> setNotesData(noteValue) async {
    final SharedPreferences dannye = await SharedPreferences.getInstance();
    dannye.setString('noteData', noteValue);
    _noteController.clear();
  }

  // Future<void> setListInfo(noteName) async {
  //   final SharedPreferences dannye = await SharedPreferences.getInstance();

  //   final listInfo = ListInfo(
  //     name: noteName,
  //     lastUpdate: DateTime.now(),
  //     count: 5,
  //   );

  //   dannye.setString(listInfoKey, jsonEncode(listInfo));
  //   _noteController.clear();
  // }
}
