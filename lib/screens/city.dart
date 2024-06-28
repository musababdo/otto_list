
import 'dart:convert';

import 'package:otto_list/constants.dart';
import 'package:otto_list/models/city_model.dart';
import 'package:otto_list/models/make_model.dart';
import 'package:otto_list/screens/choose_lang.dart';
import 'package:otto_list/screens/make.dart';
import 'package:otto_list/screens/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class City extends StatefulWidget {

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {

  String? lang;
  List<CityModel> _list = [];
  List<CityModel> _search = [];
  var loading = false;

  Future Display() async{
    setState(() {
      loading = true;
    });
    var url = Uri.parse('http://10.0.2.2/otto_list/admin/city/read_with_lang.php?lang=$lang');
    var response = await http.get(url);
    var data= json.decode(response.body);
    setState(() {
      for (Map i in data) {
        _list.add(CityModel.formJson(i));
        loading = false;
      }
    });
  }

  TextEditingController controller = new TextEditingController();

  onSearch(String text) async {
    _search.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _list.forEach((f) {
      if (f.name.contains(text) || f.id.toString().contains(text))
        _search.add(f);
    });

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lang = box.read('lang');
    Display();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double appBarHeight = AppBar().preferredSize.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return SafeArea(
      child: WillPopScope(
        onWillPop:(){
          Get.to(ChooseLang());
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kMainColor,
            centerTitle: true,
            title: Text('city_title'.tr,
              style: GoogleFonts.cairo(
                textStyle: TextStyle(),),),),
          backgroundColor: Colors.white,
          body: Container(
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.search),
                      title: TextField(
                        controller: controller,
                        onChanged: onSearch,
                        decoration: InputDecoration(
                            hintText: "make_search".tr, border: InputBorder.none),),
                      trailing: IconButton(
                        onPressed: () {
                          controller.clear();
                          onSearch('');
                        },
                        icon: Icon(Icons.cancel),
                      ),
                    ),
                  ),
                ),
                loading
                    ? Center(
                  child: Image.asset('assets/image/loader.gif'),
                )
                    : Expanded(
                  child: _search.length != 0 || controller.text.isNotEmpty
                      ? ListView.builder(
                    itemCount: _search.length,
                    itemBuilder: (context, i) {
                      final b = _search[i];
                      List list = _search;
                      return Padding(
                        padding: EdgeInsets.fromLTRB(7, 5, 7, 0),
                        child: GestureDetector(
                          onTap:(){
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => Details(list: list,index: index,),),);
                            Get.to(Make());
                            box.write('city_id', b.id);
                            box.write('city', b.name);
                          },
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(b.name),
                              ),
                              Divider()
                            ],
                          )
                        ),
                      );
                    },
                  )
                      : ListView.builder(
                    itemCount: _list.length,
                    itemBuilder: (context, i) {
                      final a = _list[i];
                      List list = _list;
                      return Padding(
                        padding: EdgeInsets.fromLTRB(7, 5, 7, 0),
                        child: GestureDetector(
                          onTap:(){
                            //Navigator.push(context, MaterialPageRoute(builder: (context) => Details(list: list,index: index,),),);
                            Get.to(Make());
                            box.write('city_id', a.id);
                            box.write('city', a.name);
                          },
                          child: Column(
                            children: [
                              ListTile(
                                title: Text(a.name),
                              ),
                              Divider()
                            ],
                          )
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
