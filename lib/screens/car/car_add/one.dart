
import 'dart:async';
import 'dart:convert';
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

class AddOne extends StatefulWidget {
  const AddOne({Key? key}) : super(key: key);

  @override
  State<AddOne> createState() => _AddOneState();
}

class _AddOneState extends State<AddOne> {

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  TextEditingController year = new TextEditingController();
  TextEditingController kilo = new TextEditingController();
  TextEditingController price = new TextEditingController();
  TextEditingController number = new TextEditingController();

  var selectedCityArabic;
  List myCityArabic=[];
  Future getCityArabic() async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/city/read_ar.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myCityArabic=data;
    });
    return data;
  }
  var selectedCityEnglish;
  List myCityEnglish=[];
  Future getCityEnglish() async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/city/read_en.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myCityEnglish=data;
    });
    return data;
  }
  var selectedMake;
  List myData=[];
  Future getMake() async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/make/read.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myData=data;
    });
    return data;
  }
  var selectedModel;
  List myModelData=[];
  Future getModel(String make) async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/model/read_view_with_make.php');
    var response = await http.post(url, body: {
      "make": make,
    });
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myModelData=data;
    });
    return data;
  }

  var selectedTrim;
  List myTrimData=[];
  Future getTrim(String make,String model) async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/trim/read_view_with_make.php');
    var response = await http.post(url, body: {
      "make": make,
      "model": model,
    });
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myTrimData=data;
    });
    return data;
  }
  var selectedRegionalArabic;
  List myRegionalArabicData=[];
  Future getRegionalArabic() async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/regional_specs/read_ar.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myRegionalArabicData=data;
    });
    return data;
  }
  var selectedRegionalEnglish;
  List myRegionalEnglishData=[];
  Future getRegionalEnglish() async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/regional_specs/read_en.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myRegionalEnglishData=data;
    });
    return data;
  }
  var selectedFuelTypeArabic;
  List myFuelTypeArabicData=[];
  Future getFuelTypeArabic() async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/fuel_type/read_ar.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myFuelTypeArabicData=data;
    });
    return data;
  }
  var selectedFuelTypeEnglish;
  List myFuelTypeEnglishData=[];
  Future getFuelTypeEnglish() async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/fuel_type/read_en.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myFuelTypeEnglishData=data;
    });
    return data;
  }
  var selectedBodyCondArabic;
  List myBodyCondArabicData=[];
  Future getBodyCondArabic() async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/body_condition/read_ar.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myBodyCondArabicData=data;
    });
    return data;
  }
  var selectedBodyCondEnglish;
  List myBodyCondEnglishData=[];
  Future getBodyCondEnglish() async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/body_condition/read_en.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myBodyCondEnglishData=data;
    });
    return data;
  }
  var selectedMechCondArabic;
  List myMechCondArabicData=[];
  Future getMechCondArabic() async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/mechanical_condition/read_ar.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myMechCondArabicData=data;
    });
    return data;
  }
  var selectedMechCondEnglish;
  List myMechCondEnglishData=[];
  Future getMechCondEnglish() async {
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/mechanical_condition/read_en.php');
    var response = await http.get(url);
    var jsonBody=response.body;
    var data=json.decode(jsonBody);
    setState(() {
      myMechCondEnglishData=data;
    });
    return data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    number.text = box.read('phone');
    getCityArabic();
    getCityEnglish();
    getMake();
    getRegionalArabic();
    getRegionalEnglish();
    getFuelTypeArabic();
    getFuelTypeEnglish();
    getBodyCondArabic();
    getBodyCondEnglish();
    getMechCondArabic();
    getMechCondEnglish();
  }

  String? _errorMessage(String hint) {
    if(hint=="home_year".tr){
      return 'login_error'.tr;
    }else if(hint=="home_kilo".tr){
      return 'login_error'.tr;
    }else if(hint=="price".tr){
      return 'login_error'.tr;
    }else if(hint=="myphone".tr){
      return 'login_error'.tr;
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Form(
      key: _globalKey,
      child: SafeArea(
        child: WillPopScope(
          onWillPop:(){
            Get.to(CarDisplay());
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
                        if (_globalKey.currentState!.validate()){
                          _globalKey.currentState!.save();
                          try{
                            if(selectedMake==null||selectedModel==null||selectedTrim==null||selectedRegionalArabic==null||selectedRegionalEnglish==null||selectedFuelTypeArabic==null||selectedFuelTypeEnglish==null||selectedBodyCondArabic==null||selectedBodyCondEnglish==null||selectedMechCondArabic==null||selectedMechCondEnglish==null){
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
                              box.write('city_ar', selectedCityArabic);
                              box.write('city_en', selectedCityEnglish);
                              box.write('make', selectedMake);
                              box.write('model', selectedModel);
                              box.write('trim', selectedTrim);
                              box.write('regional_ar', selectedRegionalArabic);
                              box.write('regional_en', selectedRegionalEnglish);
                              box.write('fuel_ar', selectedFuelTypeArabic);
                              box.write('fuel_en', selectedFuelTypeEnglish);
                              box.write('body_cond_ar', selectedBodyCondArabic);
                              box.write('body_cond_en', selectedBodyCondEnglish);
                              box.write('mech_cond_ar', selectedMechCondArabic);
                              box.write('mech_cond_en', selectedMechCondEnglish);
                              box.write('year', year.text);
                              box.write('kilo', kilo.text);
                              box.write('price', price.text);
                              box.write('number', number.text);
                              Get.to(AddTwo());
                            }
                          }on PlatformException catch(e){

                          }
                        }else{

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
                            value: selectedCityArabic,
                            hint: Text('city_arabic'.tr),
                            items: myCityArabic.map(( map){
                              return DropdownMenuItem(
                                child: Text(map['name_ar']),
                                value: map['name_ar'],
                              );
                            }).toList(),
                            onChanged:(value){
                              setState(() {
                                selectedCityArabic=value;
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
                            value: selectedCityEnglish,
                            hint: Text('city_english'.tr),
                            items: myCityEnglish.map(( map){
                              return DropdownMenuItem(
                                child: Text(map['name_en']),
                                value: map['name_en'],
                              );
                            }).toList(),
                            onChanged:(value){
                              setState(() {
                                selectedCityEnglish=value;
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
                            value: selectedMake,
                            hint: Text('search_make'.tr),
                            items: myData.map(( map){
                              return DropdownMenuItem(
                                child: Text(map['name']),
                                value: map['name'],
                              );
                            }).toList(),
                            onChanged:(value){
                              setState(() {
                                selectedMake=value;
                                selectedModel = null;
                                selectedTrim = null;
                                getModel(selectedMake);
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
                            value: selectedModel,
                            hint: Text('search_model'.tr),
                            items: myModelData.map(( map){
                              return DropdownMenuItem(
                                child: Text(map['name']),
                                value: map['name'],
                              );
                            }).toList(),
                            onChanged:(value){
                              setState(() {
                                selectedModel=value;
                                selectedTrim = null;
                                getTrim(selectedMake, selectedModel);
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
                            value: selectedTrim,
                            hint: Text('search_trim'.tr),
                            items: myTrimData.map(( map){
                              return DropdownMenuItem(
                                child: Text(map['name']),
                                value: map['name'],
                              );
                            }).toList(),
                            onChanged:(value){
                              setState(() {
                                selectedTrim=value;
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
                            value: selectedRegionalArabic,
                            hint: Text('choose_regional_specs_arabic'.tr),
                            items: myRegionalArabicData.map(( map){
                              return DropdownMenuItem(
                                child: Text(map['name_ar']),
                                value: map['name_ar'],
                              );
                            }).toList(),
                            onChanged:(value){
                              setState(() {
                                selectedRegionalArabic=value;
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
                            value: selectedRegionalEnglish,
                            hint: Text('choose_regional_specs_english'.tr),
                            items: myRegionalEnglishData.map(( map){
                              return DropdownMenuItem(
                                child: Text(map['name_en']),
                                value: map['name_en'],
                              );
                            }).toList(),
                            onChanged:(value){
                              setState(() {
                                selectedRegionalEnglish=value;
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
                            value: selectedFuelTypeArabic,
                            hint: Text('fuel_type_arabic'.tr),
                            items: myFuelTypeArabicData.map(( map){
                              return DropdownMenuItem(
                                child: Text(map['name_ar']),
                                value: map['name_ar'],
                              );
                            }).toList(),
                            onChanged:(value){
                              setState(() {
                                selectedFuelTypeArabic=value;
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
                            value: selectedFuelTypeEnglish,
                            hint: Text('fuel_type_english'.tr),
                            items: myFuelTypeEnglishData.map(( map){
                              return DropdownMenuItem(
                                child: Text(map['name_en']),
                                value: map['name_en'],
                              );
                            }).toList(),
                            onChanged:(value){
                              setState(() {
                                selectedFuelTypeEnglish=value;
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
                            value: selectedBodyCondArabic,
                            hint: Text('body_cond_arabice'.tr),
                            items: myBodyCondArabicData.map(( map){
                              return DropdownMenuItem(
                                child: Text(map['name_ar']),
                                value: map['name_ar'],
                              );
                            }).toList(),
                            onChanged:(value){
                              setState(() {
                                selectedBodyCondArabic=value;
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
                            value: selectedBodyCondEnglish,
                            hint: Text('body_cond_english'.tr),
                            items: myBodyCondEnglishData.map(( map){
                              return DropdownMenuItem(
                                child: Text(map['name_en']),
                                value: map['name_en'],
                              );
                            }).toList(),
                            onChanged:(value){
                              setState(() {
                                selectedBodyCondEnglish=value;
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
                            value: selectedMechCondArabic,
                            hint: Text('mecha_cond_arabic'.tr),
                            items: myMechCondArabicData.map(( map){
                              return DropdownMenuItem(
                                child: Text(map['name_ar']),
                                value: map['name_ar'],
                              );
                            }).toList(),
                            onChanged:(value){
                              setState(() {
                                selectedMechCondArabic=value;
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
                            value: selectedMechCondEnglish,
                            hint: Text('mecha_cond_english'.tr),
                            items: myMechCondEnglishData.map(( map){
                              return DropdownMenuItem(
                                child: Text(map['name_en']),
                                value: map['name_en'],
                              );
                            }).toList(),
                            onChanged:(value){
                              setState(() {
                                selectedMechCondEnglish=value;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      validator:(value) {
                        if (value!.isEmpty) {
                          return _errorMessage("home_year".tr);
                          // ignore: missing_return
                        }
                      },
                      controller: year,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.blue),
                          hintText: "home_year".tr
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      validator:(value) {
                        if (value!.isEmpty) {
                          return _errorMessage("home_kilo".tr);
                          // ignore: missing_return
                        }
                      },
                      controller: kilo,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.blue),
                          hintText: "home_kilo".tr
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      validator:(value) {
                        if (value!.isEmpty) {
                          return _errorMessage("price".tr);
                          // ignore: missing_return
                        }
                      },
                      controller: price,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.blue),
                          hintText: "price".tr
                      ),
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      validator:(value) {
                        if (value!.isEmpty) {
                          return _errorMessage("myphone".tr);
                          // ignore: missing_return
                        }
                      },
                      controller: number,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.blue),
                          hintText: "myphone".tr
                      ),
                    ),
                    SizedBox(height: 15,),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
