import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_pref/models/list_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  String? noteValue;
  ListInfo? listInfoData;
  final listInfoKey = 'listInfo';

  @override
  void initState() {
    super.initState();

    getNotes();
    //getListInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notes List'),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(40),
        child: noteValue == null
            ? Text('no notes available')
            : Row(
                children: [
                  Text(
                    noteValue!,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  void getNotes() async {
    final SharedPreferences dannye = await SharedPreferences.getInstance();
    noteValue = dannye.getString('noteData');
    setState(() {});
  }

  // void getListInfo() async {
  //   var dannye = await SharedPreferences.getInstance();
  //   noteValue = dannye.getString(listInfoKey);
  //   listInfoData = jsonDecode(noteValue.toString());
  //   setState(() {});
  // }
}
