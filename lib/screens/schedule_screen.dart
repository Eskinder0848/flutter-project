import 'package:flutter/material.dart';

class ScheduleScreen extends StatelessWidget {
  static const id = 'schedule_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Clock',
              style: TextStyle(
                fontFamily: 'Raleway-Light',
                fontWeight: FontWeight.w700,
                color: Colors.deepOrange.shade400,
                fontSize: 24,
              ),
            ),
            ListView(),
          ],
        ),
      ),
    );
  }
}
