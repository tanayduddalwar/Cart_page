import 'dart:async';
import 'package:flutter/material.dart';

class AnotherPage extends StatefulWidget {
  @override
  _AnotherPageState createState() => _AnotherPageState();
}

class _AnotherPageState extends State<AnotherPage> {
  bool _showScrollDownIcon = true;
  double _offset = 0.0;
  late Timer _timer;
  bool _moveUp = true;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      setState(() {
        if (_moveUp) {
          _offset -= 2.0;
          if (_offset <= -10.0) {
            _moveUp = false;
          }
        } else {
          _offset += 2.0;
          if (_offset >= 10.0) {
            _moveUp = true;
          }
        }
      });
    });

    Timer(Duration(seconds: 7), () {
      setState(() {
        _showScrollDownIcon = false;
        _timer.cancel(); // Stop the periodic animation
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Another Page'),
      ),
      body: Stack(
        children: [
          Container(
            color: Colors.white,
            child: Center(
              child: Text(
                'Content of the page',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          if (_showScrollDownIcon)
            Positioned(
              top: 0, // Start from top
              left: 0,
              right: 0,
              child: AnimatedOpacity(
                opacity: _showScrollDownIcon ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: TweenAnimationBuilder<double>(
                  tween: Tween(begin: 0.0, end: 40.0), // End value is the size you want
                  duration: Duration(seconds: 1),
                  builder: (context, value, child) {
                    return Transform.translate(
                      offset: Offset(0.0, value + _offset), // Move the icon up and down
                      child: child,
                    );
                  },
                  child: Center(
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                      size: 40.0,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }
}