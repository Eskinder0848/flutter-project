import 'package:drowsiness_detector/screens/authentication%20screens/login_screen.dart';
import 'package:drowsiness_detector/screens/report_screen.dart';
import 'package:drowsiness_detector/screens/schedule_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'constants.dart';
import 'custom_paints/green_painter.dart';
import 'custom_paints/green_painter_Landscape.dart';

//The widget below is used for buttons on the app
class Buttons extends StatelessWidget {
  final String text;
  final Function onPress;
  Buttons({@required this.text, @required this.onPress});
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      color: Colors.deepOrange.shade400.withOpacity(0.8),
      onPressed: onPress,
      child: Text(text,
        style: kButtonTextStyle,
      ),
    );
  }
}

//The widget below is for welcome page portarit style
 CustomPaint portraitWelcomePage() {
    return CustomPaint(
      painter: GreenPainter(),
      child: SizedBox.expand(
        child: Container(
          child: Flexible(
            child: Container(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 15),
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 50),
                    Text(
                      'SAFE',
                      textAlign: TextAlign.start,
                      style: kTitleTextStyle,
                    ),
                    Text(
                      'DRIVE',
                      textAlign: TextAlign.start,
                      style: kTitleTextStyle.copyWith(
                        fontSize: 30,
                        fontFamily: 'Lato',
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.5),
                    Flexible(
                      child: Buttons(
                        text: 'Active Report',
                        onPress: () {
                          Navigator.pushNamed(context, ReportTiles.id);
                        },
                      ),
                    ),
                    SizedBox(height: 20),
                    Flexible(
                      child: Buttons(
                        text: 'Make a Schedule',
                        onPress: () {
                          Navigator.pushNamed(context, ScheduleScreen.id);
                        },
                      ),
                    ),
                    SizedBox(height: 40),
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, LoginScreen.id);
                        },
                        child: CircleAvatar(
                          backgroundColor:
                              Colors.deepOrange.shade400.withOpacity(0.8),
                          radius: 20,
                          child: Icon(
                            Icons.person,
                            size: 25,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

//The widget below is for landscape welcome page style
  CustomPaint landscapeWelcomePage() {
    return CustomPaint(
      painter: GreenPainterLandscape(),
      child: SizedBox.expand(
        child: Container(
          child: Flexible(
            child: Container(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 15),
              child: LayoutBuilder(builder: (context, constraints) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: constraints.maxHeight * 0.15),
                    Text(
                      'SAFE',
                      textAlign: TextAlign.start,
                      style: kTitleTextStyle,
                    ),
                    Text(
                      'DRIVE',
                      textAlign: TextAlign.start,
                      style: kTitleTextStyle.copyWith(
                        fontSize: 40,
                        fontFamily: 'Lato',
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: constraints.maxHeight * 0.33),
                    Row(
                      children: <Widget>[
                        Buttons(
                          text: 'Active Report',
                          onPress: () {
                            Navigator.pushNamed(context, ReportTiles.id);
                          },
                        ),
                        SizedBox(width: constraints.maxWidth * 0.03),
                        Buttons(
                          text: 'Make a Schedule',
                          onPress: () {
                            Navigator.pushNamed(context, ScheduleScreen.id);
                          },
                        ),
                        SizedBox(width: constraints.maxWidth * 0.4),
                          GestureDetector(
                            onTap: () {
                             Navigator.pushNamed(context, LoginScreen.id);
                             },
                              child: CircleAvatar(
                              backgroundColor:
                                  Colors.deepOrange.shade400.withOpacity(0.8),
                              radius: 20,
                              child: Icon(
                                Icons.person,
                                size: 25,
                                color: Colors.white,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

