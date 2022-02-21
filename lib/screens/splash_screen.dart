// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hio_mobile_candidate/screens/auth/auth_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isSubShown = false;
  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 250), () {
        setState(() {
          isSubShown = true;
        });
      });
      await Future.delayed(const Duration(milliseconds: 1000), () {
        setState(() {
          isSubShown = false;
        });
      });
      await Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.of(context)
            .push(NavigationAnimation(child: const AuthScreen()));
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3096F3),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Hero(
          tag: 'tag',
          transitionOnUserGestures: true,
          child: Material(
            type: MaterialType.transparency,
            child: SizedBox(
              height: 77,
              width: 93,
              // margin: EdgeInsets.fromLTRB(160.sp, 104.sp, 160.sp, 0),
              child: Text(
                'hio',
                style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 64.sp,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        AnimatedOpacity(
          duration: const Duration(milliseconds: 650),
          opacity: isSubShown ? 1 : 0,
          child: Center(
            child: Text(
              'AUGMENT YOUR HIRING',
              style: GoogleFonts.nunito(
                  color: Colors.white,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w300),
            ),
          ),
        )
      ]),
    );
  }
}

class NavigationAnimation extends PageRouteBuilder {
  final Widget child;
  NavigationAnimation({required this.child})
      : super(
          transitionDuration: const Duration(milliseconds: 1000),
          pageBuilder: (context, animation, secondaryAnimation) => child,
        );

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}
