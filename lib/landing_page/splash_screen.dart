import 'package:cart_page/landing_page/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  bool _initialized = false;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video3.mp4')
      ..initialize().then((_) {
        setState(() {
          _initialized = true;
        });
        _controller.play();
        _controller.addListener(() {
          if (_controller.value.isPlaying) {
            // Do something when the video is playing
          } else if (_controller.value.isInitialized &&
              !_controller.value.isPlaying) {
            // Start animation to navigate to the home page
            _animationController.forward();
          }
        });
      });

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500), // Adjust duration as needed
    );
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Navigate to the home page when animation completes
        Get.off(() => HomePage());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: _initialized
                ? Container(
                    height: Get.height,
                    width: Get.width,
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    ),
                  )
                : CircularProgressIndicator(),
          ),
          AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return Transform.translate(
                offset: Offset(
                    0.0,
                    (1.0 - _animationController.value) *
                        MediaQuery.of(context).size.height),
                child: Opacity(
                  opacity: _animationController.value,
                  child: child,
                ),
              );
            },
            child: Center(
                // Use your home page widget here
                ),
          ),
        ],
      ),
    );
  }
}
