
import 'dart:convert';

import 'package:otto_list/constants.dart';
import 'package:otto_list/screens/home.dart';
import 'package:otto_list/screens/search_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Search extends StatefulWidget {

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  TextEditingController price_min = TextEditingController();
  TextEditingController price_max = TextEditingController();
  TextEditingController year_min = TextEditingController();
  TextEditingController year_max = TextEditingController();
  TextEditingController kilo_min = TextEditingController();
  TextEditingController kilo_max = TextEditingController();

  String? lang;

  var selectedCity;
  List myCityData=[];
  Future getCity() async{
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/city/read_with_lang.php?lang=$lang');
    var response = await http.get(url);
    var data= json.decode(response.body);
    setState(() {
      myCityData=data;
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

  var selectedRegional;
  List myRegionalData=[];
  Future getRegional() async{
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/regional_specs/read_with_lang.php?lang=$lang');
    var response = await http.get(url);
    var data= json.decode(response.body);
    setState(() {
      myRegionalData=data;
    });
    return data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lang = box.read('lang');
    getCity();
    getMake();
    getRegional();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop:(){
          Get.to(Home());
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Text('search_title'.tr,
              style: GoogleFonts.cairo(
                textStyle: TextStyle(color: Colors.black),),),
            leading: GestureDetector(
              onTap: () {
                Get.to(Home());
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
          ),
            persistentFooterButtons: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15,right: 15,bottom: 8,top: 8),
                child: Builder(
                  builder: (context) => ElevatedButton(
                    onPressed: () {
                      box.write('s_city',selectedCity);
                      box.write('s_make',selectedMake);
                      box.write('s_model',selectedModel);
                      box.write('s_trim',selectedTrim);
                      box.write('s_regional',selectedRegional);
                      box.write('s_price_min',price_min.text);
                      box.write('s_price_max',price_max.text);
                      box.write('s_year_min',year_min.text);
                      box.write('s_year_max',year_max.text);
                      box.write('s_kilo_min',kilo_min.text);
                      box.write('s_kilo_max',kilo_max.text);
                      Get.to(SearchResult());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kMainColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20,right: 20,bottom: 5,top: 5),
                      child: Center(
                          child:Text(
                            "search_title".tr,
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
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
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
                          value: selectedCity,
                          hint: Text('search_city'.tr),
                          items: myCityData.map(( map){
                            return DropdownMenuItem(
                              child: Text(map['name']),
                              value: map['name'],
                            );
                          }).toList(),
                          onChanged:(value){
                            setState(() {
                              selectedCity=value;
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
                          value: selectedRegional,
                          hint: Text('search_regional'.tr),
                          items: myRegionalData.map(( map){
                            return DropdownMenuItem(
                              child: Text(map['name_$lang']),
                              value: map['name_$lang'],
                            );
                          }).toList(),
                          onChanged:(value){
                            setState(() {
                              selectedRegional=value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text(
                    'search_price'.tr,
                    style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                          fontSize: 20,
                          color:Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(right: 10,left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          child: TextFormField(
                            controller: price_min,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintStyle: TextStyle(color: kMainColor),
                                hintText: "search_min".tr
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          child: TextFormField(
                            controller: price_max,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintStyle: TextStyle(color: kMainColor),
                                hintText: "search_max".tr
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text(
                    'search_year'.tr,
                    style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color:Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(right: 10,left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          child: TextFormField(
                            controller: year_min,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintStyle: TextStyle(color: kMainColor),
                                hintText: "search_min".tr
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          child: TextFormField(
                            controller: year_max,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintStyle: TextStyle(color: kMainColor),
                                hintText: "search_max".tr
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text(
                    'search_kilo'.tr,
                    style: GoogleFonts.cairo(
                      textStyle: TextStyle(
                        fontSize: 20,
                        color:Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.only(right: 10,left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          child: TextFormField(
                            controller: kilo_min,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintStyle: TextStyle(color: kMainColor),
                                hintText: "search_min".tr
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          child: TextFormField(
                            controller: kilo_max,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                hintStyle: TextStyle(color: kMainColor),
                                hintText: "search_max".tr
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}
