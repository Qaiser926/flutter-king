// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   List Value;
//   HomePage({Key key,@required this.Value}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState(Value);
// }

// class _HomePageState extends State<HomePage> {
//   List Value;
//   _HomePageState(this.Value);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text(Value[2]),
//       ),
//     );
//   }
// }

import 'package:expandable_listview_example/DBHelper/DBHelpler.dart';
import 'package:flutter/material.dart';

class homeDb extends StatefulWidget {
  @override
  State<homeDb> createState() => _homeDbState();
}

class _homeDbState extends State<homeDb> {
  @override
  void initState() {
    super.initState();
    createEntry();
    getAllNotes();
  }

  Future createEntry() async {
    await NotesDatabase.intance.InsertEntry();
  }

  Future<String> getAllNotes() async {
    await NotesDatabase.intance.readAllNotes();
  }

  Future<String> getOneNote() async {
    await NotesDatabase.intance.readONeNote(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
