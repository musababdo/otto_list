
import 'dart:async';
import 'dart:convert';
import 'package:otto_list/screens/car/car_add/one.dart';
import 'package:otto_list/screens/car/car_add/three.dart';
import 'package:otto_list/screens/car/car_add/two.dart';
import 'package:otto_list/screens/car/display.dart';
import 'package:otto_list/screens/home.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:otto_list/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AddTwo extends StatefulWidget {
  const AddTwo({Key? key}) : super(key: key);

  @override
  State<AddTwo> createState() => _AddTwoState();
}

class _AddTwoState extends State<AddTwo> {

  var selectedExteriorArabic;
  List myExteriorArabicData=[];
  Future getExteriorArabic() async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/exterior_color/read_ar.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myExteriorArabicData=data;
    });
    return data;
  }
  var selectedExteriorEnglish;
  List myExteriorEnglishData=[];
  Future getExteriorEnglish() async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/exterior_color/read_en.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myExteriorEnglishData=data;
    });
    return data;
  }
  var selectedInteriorArabic;
  List myInteriorArabicData=[];
  Future getInteriorArabic() async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/interior_color/read_ar.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myInteriorArabicData=data;
    });
    return data;
  }
  var selectedInteriorEnglish;
  List myInteriorEnglishData=[];
  Future getInteriorEnglish() async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/interior_color/read_en.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myInteriorEnglishData=data;
    });
    return data;
  }
  var selectedDoorsArabic;
  List myDoorsArabicData=[];
  Future getDoorsArabic() async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/doors/read_ar.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myDoorsArabicData=data;
    });
    return data;
  }
  var selectedDoorsEnglish;
  List myDoorsEnglishData=[];
  Future getDoorsEnglish() async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/doors/read_en.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myDoorsEnglishData=data;
    });
    return data;
  }
  var selectedNoOfArabic;
  List myNoOfArabicData=[];
  Future getNoOfArabic() async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/no_of_cylinders/read_ar.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myNoOfArabicData=data;
    });
    return data;
  }
  var selectedNoOfEnglish;
  List myNoOfEnglishData=[];
  Future getNoOfEnglish() async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/no_of_cylinders/read_en.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myNoOfEnglishData=data;
    });
    return data;
  }
  var selectedTransArabic;
  List myTransArabicData=[];
  Future getTransArabic() async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/transmission_type/read_ar.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myTransArabicData=data;
    });
    return data;
  }
  var selectedTransEnglish;
  List myTransEnglishData=[];
  Future getTransEnglish() async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/transmission_type/read_en.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myTransEnglishData=data;
    });
    return data;
  }
  var selectedBodyTypeArabic;
  List myBodyTypeArabicData=[];
  Future getBodyTypeArabic() async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/body_type/read_ar.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myBodyTypeArabicData=data;
    });
    return data;
  }
  var selectedBodyTypeEnglish;
  List myBodyTypeEnglishData=[];
  Future getBodyTypeEnglish() async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/body_type/read_en.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myBodyTypeEnglishData=data;
    });
    return data;
  }
  var selectedHorseArabic;
  List myHorseArabicData=[];
  Future getHorseArabic() async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/horsepower/read_ar.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myHorseArabicData=data;
    });
    return data;
  }
  var selectedHorseEnglish;
  List myHorseEnglishData=[];
  Future getHorseEnglish() async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/horsepower/read_en.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myHorseEnglishData=data;
    });
    return data;
  }
  var selectedSteeringArabic;
  List mySteeringArabicData=[];
  Future getSteeringArabic() async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/steering_side/read_ar.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      mySteeringArabicData=data;
    });
    return data;
  }
  var selectedSteeringEnglish;
  List mySteeringEnglishData=[];
  Future getSteeringEnglish() async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/steering_side/read_en.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      mySteeringEnglishData=data;
    });
    return data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getExteriorArabic();
    getExteriorEnglish();
    getInteriorArabic();
    getInteriorEnglish();
    getDoorsArabic();
    getDoorsEnglish();
    getNoOfArabic();
    getNoOfEnglish();
    getTransArabic();
    getTransEnglish();
    getBodyTypeArabic();
    getBodyTypeEnglish();
    getHorseArabic();
    getHorseEnglish();
    getSteeringArabic();
    getSteeringEnglish();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: WillPopScope(
        onWillPop:(){
          Get.to(AddOne());
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kMainColor,
            centerTitle: true,
            title: Text(
              'add_car'.tr,
              style: GoogleFonts.cairo(
                textStyle: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
          ),
          persistentFooterButtons: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,bottom: 8,top: 8),
              child: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () {
                    if(selectedExteriorArabic==null||selectedExteriorEnglish==null||selectedInteriorArabic==null||selectedInteriorEnglish==null||selectedDoorsArabic==null||selectedDoorsEnglish==null||selectedNoOfArabic==null||selectedNoOfEnglish==null||selectedTransArabic==null||selectedTransEnglish==null||selectedBodyTypeArabic==null||selectedBodyTypeEnglish==null||selectedHorseArabic==null||selectedHorseEnglish==null||selectedSteeringArabic==null||selectedSteeringEnglish==null){
                      Fluttertoast.showToast(
                          msg: "please_choose_all".tr,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }else{
                      box.write('exterior_ar', selectedExteriorArabic);
                      box.write('exterior_en', selectedExteriorEnglish);
                      box.write('interior_ar', selectedInteriorArabic);
                      box.write('interior_en', selectedInteriorEnglish);
                      box.write('doors_ar', selectedDoorsArabic);
                      box.write('doors_en', selectedDoorsEnglish);
                      box.write('no_of_ar', selectedNoOfArabic);
                      box.write('no_of_en', selectedNoOfEnglish);
                      box.write('trans_ar', selectedTransArabic);
                      box.write('trans_en', selectedTransEnglish);
                      box.write('body_type_ar', selectedBodyTypeArabic);
                      box.write('body_type_en', selectedBodyTypeEnglish);
                      box.write('horse_ar', selectedHorseArabic);
                      box.write('horse_en', selectedHorseEnglish);
                      box.write('sterring_ar', selectedSteeringArabic);
                      box.write('sterring_en', selectedSteeringEnglish);
                      Get.to(AddThree());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kMainColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,bottom: 5,top: 5),
                    child: Center(
                        child:Text(
                          "next".tr,
                          style: GoogleFonts.cairo(
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                    ),
                  ),
                ),
              ),
            ),
          ],
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: kMainColor, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10,left: 10),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: selectedExteriorArabic,
                          hint: Text('exterior_arabic'.tr),
                          items: myExteriorArabicData.map(( map){
                            return DropdownMenuItem(
                              child: Text(map['name_ar']),
                              value: map['name_ar'],
                            );
                          }).toList(),
                          onChanged:(value){
                            setState(() {
                              selectedExteriorArabic=value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: kMainColor, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10,left: 10),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: selectedExteriorEnglish,
                          hint: Text('exterior_english'.tr),
                          items: myExteriorEnglishData.map(( map){
                            return DropdownMenuItem(
                              child: Text(map['name_en']),
                              value: map['name_en'],
                            );
                          }).toList(),
                          onChanged:(value){
                            setState(() {
                              selectedExteriorEnglish=value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: kMainColor, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10,left: 10),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: selectedInteriorArabic,
                          hint: Text('interior_arabic'.tr),
                          items: myInteriorArabicData.map(( map){
                            return DropdownMenuItem(
                              child: Text(map['name_ar']),
                              value: map['name_ar'],
                            );
                          }).toList(),
                          onChanged:(value){
                            setState(() {
                              selectedInteriorArabic=value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: kMainColor, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10,left: 10),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: selectedInteriorEnglish,
                          hint: Text('interior_english'.tr),
                          items: myInteriorEnglishData.map(( map){
                            return DropdownMenuItem(
                              child: Text(map['name_en']),
                              value: map['name_en'],
                            );
                          }).toList(),
                          onChanged:(value){
                            setState(() {
                              selectedInteriorEnglish=value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: kMainColor, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10,left: 10),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: selectedDoorsArabic,
                          hint: Text('doors_arabice'.tr),
                          items: myDoorsArabicData.map(( map){
                            return DropdownMenuItem(
                              child: Text(map['name_ar']),
                              value: map['name_ar'],
                            );
                          }).toList(),
                          onChanged:(value){
                            setState(() {
                              selectedDoorsArabic=value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: kMainColor, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10,left: 10),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: selectedDoorsEnglish,
                          hint: Text('doors_english'.tr),
                          items: myDoorsEnglishData.map(( map){
                            return DropdownMenuItem(
                              child: Text(map['name_en']),
                              value: map['name_en'],
                            );
                          }).toList(),
                          onChanged:(value){
                            setState(() {
                              selectedDoorsEnglish=value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: kMainColor, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10,left: 10),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: selectedNoOfArabic,
                          hint: Text('no_of_arabic'.tr),
                          items: myNoOfArabicData.map(( map){
                            return DropdownMenuItem(
                              child: Text(map['name_ar']),
                              value: map['name_ar'],
                            );
                          }).toList(),
                          onChanged:(value){
                            setState(() {
                              selectedNoOfArabic=value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: kMainColor, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10,left: 10),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: selectedNoOfEnglish,
                          hint: Text('no_of_english'.tr),
                          items: myNoOfEnglishData.map(( map){
                            return DropdownMenuItem(
                              child: Text(map['name_en']),
                              value: map['name_en'],
                            );
                          }).toList(),
                          onChanged:(value){
                            setState(() {
                              selectedNoOfEnglish=value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: kMainColor, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10,left: 10),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: selectedTransArabic,
                          hint: Text('trans_arabic'.tr),
                          items: myTransArabicData.map(( map){
                            return DropdownMenuItem(
                              child: Text(map['name_ar']),
                              value: map['name_ar'],
                            );
                          }).toList(),
                          onChanged:(value){
                            setState(() {
                              selectedTransArabic=value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: kMainColor, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10,left: 10),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: selectedTransEnglish,
                          hint: Text('trans_english'.tr),
                          items: myTransEnglishData.map(( map){
                            return DropdownMenuItem(
                              child: Text(map['name_en']),
                              value: map['name_en'],
                            );
                          }).toList(),
                          onChanged:(value){
                            setState(() {
                              selectedTransEnglish=value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: kMainColor, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10,left: 10),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: selectedBodyTypeArabic,
                          hint: Text('body_type_arabic'.tr),
                          items: myBodyTypeArabicData.map(( map){
                            return DropdownMenuItem(
                              child: Text(map['name_ar']),
                              value: map['name_ar'],
                            );
                          }).toList(),
                          onChanged:(value){
                            setState(() {
                              selectedBodyTypeArabic=value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: kMainColor, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10,left: 10),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: selectedBodyTypeEnglish,
                          hint: Text('body_type_english'.tr),
                          items: myBodyTypeEnglishData.map(( map){
                            return DropdownMenuItem(
                              child: Text(map['name_en']),
                              value: map['name_en'],
                            );
                          }).toList(),
                          onChanged:(value){
                            setState(() {
                              selectedBodyTypeEnglish=value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: kMainColor, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10,left: 10),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: selectedHorseArabic,
                          hint: Text('horse_arabice'.tr),
                          items: myHorseArabicData.map(( map){
                            return DropdownMenuItem(
                              child: Text(map['name_ar']),
                              value: map['name_ar'],
                            );
                          }).toList(),
                          onChanged:(value){
                            setState(() {
                              selectedHorseArabic=value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: kMainColor, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10,left: 10),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: selectedHorseEnglish,
                          hint: Text('horse_english'.tr),
                          items: myHorseEnglishData.map(( map){
                            return DropdownMenuItem(
                              child: Text(map['name_en']),
                              value: map['name_en'],
                            );
                          }).toList(),
                          onChanged:(value){
                            setState(() {
                              selectedHorseEnglish=value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: kMainColor, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10,left: 10),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: selectedSteeringArabic,
                          hint: Text('steering_arabic'.tr),
                          items: mySteeringArabicData.map(( map){
                            return DropdownMenuItem(
                              child: Text(map['name_ar']),
                              value: map['name_ar'],
                            );
                          }).toList(),
                          onChanged:(value){
                            setState(() {
                              selectedSteeringArabic=value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(
                          color: kMainColor, style: BorderStyle.solid, width: 0.80),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10,left: 10),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          value: selectedSteeringEnglish,
                          hint: Text('steering_english'.tr),
                          items: mySteeringEnglishData.map(( map){
                            return DropdownMenuItem(
                              child: Text(map['name_en']),
                              value: map['name_en'],
                            );
                          }).toList(),
                          onChanged:(value){
                            setState(() {
                              selectedSteeringEnglish=value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
