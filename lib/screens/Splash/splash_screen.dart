import 'dart:async';

import 'package:flutter/material.dart';
import 'package:semec_task/constant/App_Colors.dart';
import 'package:semec_task/screens/Home%20Page%20View/home_page_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const HomePageView()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: Center(
        child: Image.asset('assets/images/Logo.png'),
      ),
    );
  }
}
