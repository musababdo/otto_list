
import 'package:otto_list/constants.dart';
import 'package:otto_list/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Location extends StatefulWidget {

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop:(){
          Get.to(Home());
          return Future.value(false);
        },
        child: Scaffold(
          body: Container(
            child: Center(
              child: Text('location'),
            ),
          ),
        ),
      ),
    );
  }
}
