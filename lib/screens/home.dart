
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otto_list/constants.dart';
import 'package:otto_list/screens/car/display.dart';
import 'package:otto_list/screens/model.dart';
import 'package:otto_list/screens/pages/settings.dart';
import 'package:otto_list/screens/pages/myhome.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int? value;
  int currentIndex = 0;
  final List<Widget> _children = [
    MyHome(),
    Settings(),
  ];
  void onTabTapped(int index) {
    setState(() {
        currentIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    value = box.read('value');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop:(){
          Get.to(Model());
          return Future.value(false);
        },
        child: Scaffold(
          // bottomNavigationBar: CurvedNavigationBar(
          //   backgroundColor: Colors.transparent,
          //   buttonBackgroundColor: kMainColor,
          //   color: kMainColor,
          //   items: <Widget>[
          //     Icon(Icons.home, size: 30,color: Colors.white,),
          //     Icon(Icons.favorite, size: 30,color: Colors.white,),
          //     Icon(Icons.menu, size: 30,color: Colors.white,),
          //     Icon(Icons.menu, size: 30,color: Colors.white,),
          //     Icon(Icons.menu, size: 30,color: Colors.white,),
          //   ],
          //   onTap: (index) {
          //     onTabTapped(index);
          //   },
          // ),
          floatingActionButton: FloatingActionButton(
            onPressed:(){
              if(value != 1){
                Fluttertoast.showToast(
                    msg: "Login First".tr,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              }else{
                Get.to(CarDisplay());
              }
            } ,
            child: Icon(Icons.add,color: Colors.white,),
            backgroundColor: kMainColor,
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black38,
            showUnselectedLabels: true,
            //unselectedLabelStyle: TextStyle(color: Colors.black),
            selectedItemColor: kMainColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'home_page1_title'.tr,
                backgroundColor: Colors.white,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'home_page3_title'.tr,
                backgroundColor: Colors.white,
              ),
            ],
            currentIndex: currentIndex,
            onTap: (int x) {
              setState(() {
                onTabTapped(x);
              });
            },
          ),
          body: _children[currentIndex],
        ),
      ),
    );
  }
}
