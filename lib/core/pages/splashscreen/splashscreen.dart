// ignore: depend_on_referenced_packages
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:news_app/common/utils/constants.dart';
import 'package:news_app/common/widgets/appstyle.dart';
import 'package:news_app/common/widgets/shimmerror.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 167, 205, 224),
      body: Center(
        child: FlutterSplashScreen.fadeIn(
          duration: const Duration(seconds: 2),
          animationDuration: const Duration(seconds: 2),
          backgroundColor: Colors.white,
          onEnd: () {
            Navigator.popAndPushNamed(context, "/landingPage");
          },
          childWidget: SizedBox(
            height: 200,
            child: ShimmerError(
                respose: Text(
                  "Let's News",
                  style: appstyle(24, AppConst.kLight, FontWeight.bold),
                ),
                basecolor: AppConst.kLight,
                highlightcolor: AppConst.kGreyLight),
          ),
        ),
      ),
    );
  }
}
