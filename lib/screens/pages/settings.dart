
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otto_list/constants.dart';
import 'package:otto_list/local/local_controller.dart';
import 'package:otto_list/screens/car/display.dart';
import 'package:otto_list/screens/home.dart';
import 'package:otto_list/screens/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otto_list/screens/login.dart';
import 'package:otto_list/screens/register.dart';

class Settings extends StatefulWidget {

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  int? value;
  String? name;

  Future<void> signOut() async {
    setState(() {
      box.remove('u_id');
      box.remove('username');
      box.remove('email');
      box.remove('phone');
      box.remove('password');
      box.remove('value');
      Fluttertoast.showToast(
          msg: "logout_successfully".tr,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0
      );
      Get.to(Login());
      //SystemNavigator.pop();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    value = box.read('value');
    name = box.read('username');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  value != 1?
                  Column(
                    children: [
                      Text(
                        "home_welcome".tr,style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: kMainColor
                        ),
                      ),),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: MediaQuery.of(context).size.height / 14,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.to(Register());
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: kMainColor,
                                ),
                                child: Text(
                                  "register_btn".tr,style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.only(left: 8.0),
                              height: MediaQuery.of(context).size.height / 14,
                              child: ElevatedButton(
                                onPressed: () {
                                  Get.to(Login());
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: kMainColor,
                                ),
                                child: Text(
                                  "login_btn".tr,style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                    fontSize: 17,
                                  ),
                                ),),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ):
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        name!,style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Colors.black
                        ),
                      ),),
                      SizedBox(width: 10,),
                      CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: Image.asset(
                          'assets/image/man.png',
                          width: 80,
                          height: 80,
                        ),
                        radius: 40,
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Divider(),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      dense: true,
                      trailing: Icon(Icons.arrow_forward_ios,size: 16,),
                      title: Text("menu_change_lang".tr, style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 16
                        ),
                      ),
                      ),
                      leading: Icon(Icons.g_translate,color: kMainColor,),
                      onTap: (){
                        chooseLang();
                      },
                    ),
                  ),
                  Divider(),
                  value == 1?
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      trailing: Icon(Icons.arrow_forward_ios,size: 16,),
                      title: Text("logout".tr, style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 16
                        ),
                      ),),
                      leading: Icon(Icons.logout,color: kMainColor),
                      onTap: (){
                        signOut();
                      },
                    ),
                  ):
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      dense: true,
                      trailing: Icon(Icons.arrow_forward_ios,size: 16,),
                      title: Text("menu_exit".tr, style: GoogleFonts.cairo(
                        textStyle: TextStyle(
                            fontSize: 16
                        ),
                      ),),
                      leading: Icon(Icons.logout,color: kMainColor),
                      onTap: (){
                        exitDialog();
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
  chooseLang(){
    showModalBottomSheet(context: context, builder: (context){
      MyLocalController controller = Get.find();
      return WillPopScope(
        onWillPop:(){
          Navigator.pop(context);
          return Future.value(false);
        },
        child: SafeArea(
            child: Container(
              color: Color(0xFF737373),
              height: 180,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20),
                    topRight: const Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                            controller.changeLang("en");
                            Navigator.of(context).pop();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kMainColor, // Background color
                          ),
                          child: Text("English"),
                        ),
                        ElevatedButton(
                          onPressed: (){
                            controller.changeLang("ar");
                            Navigator.of(context).pop();
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
            )
        ),
      );
    });
  }
  exitDialog(){
    showModalBottomSheet(context: context, builder: (context){
      return WillPopScope(
        onWillPop:(){
          Navigator.pop(context);
          return Future.value(false);
        },
        child: SafeArea(
            child: Container(
              color: Color(0xFF737373),
              height: 180,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20),
                    topRight: const Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    Text("menu_exit".tr,style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                        fontSize: 20,
                      ),
                    ),),
                    const SizedBox(height:8),
                    Text('menu_alert_message'.tr,style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                        fontSize: 18,
                      ),
                    ),),
                    const SizedBox(height:10),
                    Padding(
                      padding: const EdgeInsets.only(left: 25,right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButton(
                            onPressed: () {
                              setState(() {
                                Navigator.of(context).pop();
                              });
                            },
                            child: Text('menu_alert_btn_cancel'.tr,
                              style: GoogleFonts.cairo(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                          MaterialButton(
                            onPressed: () {
                              setState(() {
                                SystemNavigator.pop();
                              });
                            },
                            child: Text('menu_alert_btn_ok'.tr,
                              style: GoogleFonts.cairo(
                                textStyle: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
        ),
      );
    });
  }
}
