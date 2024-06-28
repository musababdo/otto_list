import 'package:otto_list/constants.dart';
import 'package:otto_list/local/local.dart';
import 'package:otto_list/local/local_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:otto_list/screens/choose_lang.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:otto_list/screens/city.dart';
import 'package:otto_list/screens/home.dart';
import 'package:otto_list/screens/make.dart';

void main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Get.put(MyLocalController());
    MyLocalController c = Get.put(MyLocalController());
    FlutterNativeSplash.remove();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      //locale: Get.deviceLocale,
      locale:c.intiallang,
      translations: MyLocal(),
      //home:ChooseLang(),
      home: box.read('show')==1?City():ChooseLang(),
    );
  }
}
