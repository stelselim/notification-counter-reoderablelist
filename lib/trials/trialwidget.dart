import 'package:flutter/material.dart';

class TrialWidget extends StatefulWidget {
  const TrialWidget({Key key}) : super(key: key);

  @override
  _TrialWidgetState createState() => _TrialWidgetState();
}

class _TrialWidgetState extends State<TrialWidget> {
  List<Widget> listWidgets = [
    Container(
      key: UniqueKey(),
      padding: EdgeInsets.all(15),
      color: Colors.green.shade200,
      margin: EdgeInsets.all(30),
      child: Text("Hey There"),
    ),
    Container(
      key: UniqueKey(),
      padding: EdgeInsets.all(15),
      color: Colors.green.shade200,
      margin: EdgeInsets.all(30),
      child: Text("Selam There"),
    ),
    Container(
      key: UniqueKey(),
      padding: EdgeInsets.all(15),
      color: Colors.green.shade200,
      margin: EdgeInsets.all(30),
      child: Text("Salute There"),
    ),
    Container(
      key: UniqueKey(),
      padding: EdgeInsets.all(15),
      color: Colors.green.shade200,
      margin: EdgeInsets.all(30),
      child: Text("Hallo There"),
    ),
  ];

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: ReorderableListView(
        scrollController: scrollController,
        children: listWidgets,
        header: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "Reorderable List",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.blueGrey.shade800,
              fontSize: 25,
            ),
          ),
        ),
        onReorder: (before, after) {
          var temp = listWidgets.elementAt(before);
          listWidgets.removeAt(before);
          if (after == 0)
            listWidgets.insert(after, temp);
          else
            listWidgets.insert(after - 1, temp);
        },
      ),
    );
  }
}
