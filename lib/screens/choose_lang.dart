
import 'package:otto_list/constants.dart';
import 'package:otto_list/local/local_controller.dart';
import 'package:otto_list/screens/city.dart';
import 'package:otto_list/screens/make.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseLang extends StatefulWidget {
  const ChooseLang({Key? key}) : super(key: key);

  @override
  State<ChooseLang> createState() => _ChooseLangState();
}

class _ChooseLangState extends State<ChooseLang> {
  @override
  Widget build(BuildContext context) {
    MyLocalController controller = Get.find();
    return SafeArea(
      child: WillPopScope(
        onWillPop:(){
          SystemNavigator.pop();
          return Future.value(false);
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body:Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/image/logo_white.png', // Replace with the path to your image
                  height: 230, // Set the height of the image as needed
                ),
                SizedBox(height: 10,),
                Text('choose_lang'.tr,
                  style: GoogleFonts.cairo(
                    textStyle: TextStyle(
                      fontSize: 20
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          controller.changeLang("en");
                          box.write('show',1);
                          Get.to(City());
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kMainColor, // Background color
                      ),
                      child: Text("English"),
                    ),
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          controller.changeLang("ar");
                          box.write('show',1);
                          Get.to(City());
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kMainColor, // Background color
                      ),
                      child: Text("عربي"),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
