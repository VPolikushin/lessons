import 'package:flutter/material.dart';

final fakeData = (int count, [bool showPrint = false]) => List<Widget>.generate(
      count,
      (i) {
        //if (showPrint) print(i);
        return Container (
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: Colors.grey,
              ),
            ),
          ),
          child: ListTile(
            title:Text('$i'),
          ),
        );
      },
);