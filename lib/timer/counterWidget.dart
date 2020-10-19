import 'package:flutter/material.dart';

final counterWidget = (double time) => Container(
      padding: EdgeInsets.all(50),
      margin: EdgeInsets.all(25),
      color: Colors.blueGrey.shade100,
      child: Text(
        time.toString(),
        style: TextStyle(
          fontSize: 55,
          color: Colors.blueAccent.shade700,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
