
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:otto_list/constants.dart';
import 'package:otto_list/screens/details.dart';
import 'package:otto_list/screens/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class SearchResult extends StatefulWidget {

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {

  int _currentIndex = 0;
  var mylength=[];

  List<Widget> _buildIndicators() {
    return List<Widget>.generate(mylength.length, (index) {
      return Container(
        width: 8,
        height: 8,
        margin: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _currentIndex == index ? kMainColor : Colors.grey,
        ),
      );
    });
  }

  final formatter = new NumberFormat("###,###");

  String? lang,city,make,model,trim,regional,price_min,price_max,year_min,year_max,kilo_min,kilo_max;
  Future Display() async{
    var url = Uri.parse('http://10.0.2.2/otto_list/serach_read.php?lang=$lang');
    var response = await http.post(url, body: {
      "city": city,
      "make": make,
      "model": model,
      "trim": trim,
      "regional": regional,
      "price_min": price_min,
      "price_max": price_max,
      "year_min": year_min,
      "year_max": year_max,
      "kilo_min": kilo_min,
      "kilo_max": kilo_max,
    });
    var data= json.decode(response.body);
    return data;
  }

  Stream display() async* {
    while (true) {
      await Future.delayed(Duration(microseconds: 1));
      yield await Display();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lang = box.read('lang');
    city = box.read('s_city');
    make = box.read('s_make');
    model = box.read('s_model');
    trim = box.read('s_trim');
    regional = box.read('s_regional');
    price_min = box.read('s_price_min');
    price_max = box.read('s_price_max');
    year_min = box.read('s_year_min');
    year_max = box.read('s_year_max');
    kilo_min = box.read('s_kilo_min');
    kilo_max = box.read('s_kilo_max');
    Display();
  }

  Future editFavorite(String id,String isfavorite) async{
    var url = Uri.parse('http://10.0.2.2/otto_list/favorite_edit.php');
    var response=await http.post(url, body: {
      "id"         : id,
      "isfavorite" : isfavorite,
    });
    //json.decode(response.body);
    if(response.body.isNotEmpty) {
      json.decode(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double appBarHeight = AppBar().preferredSize.height;
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return SafeArea(
      child: WillPopScope(
        onWillPop:(){
          Get.to(Search());
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: kMainColor,
            centerTitle: true,
            title: Text('search_result'.tr,
              style: GoogleFonts.cairo(
                textStyle: TextStyle(),),),),
          backgroundColor: Colors.white,
          body:StreamBuilder(
            stream: display(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              try {
                if(snapshot.data.length > 0 ){
                  return snapshot.hasData ?
                  ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        List list = snapshot.data;
                        var image=[];
                        image = jsonDecode(list[index]['image']);
                        mylength = jsonDecode(list[index]['image']);
                        // print('//////////////');
                        // print(image);
                        // print('//////////////');
                        return GestureDetector(
                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Details(list: list,index: index,),),);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              elevation: 1,
                              child:Column(
                                crossAxisAlignment:CrossAxisAlignment.start ,
                                children: <Widget>[
                                  Container(
                                    height: 220.0,
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                            borderRadius: new BorderRadius.only(
                                              topLeft: const Radius.circular(20),
                                              topRight: const Radius.circular(20),
                                            ),
                                            child: CarouselSlider(
                                              options: CarouselOptions(
                                                height: MediaQuery.of(context).size.height / 3,
                                                aspectRatio: 16 / 9,
                                                viewportFraction: 1.0,
                                                autoPlay: true,
                                                onPageChanged: (index, reason) {
                                                  setState(() {
                                                    _currentIndex = index;
                                                  });
                                                },
                                              ),
                                              items: List.generate(
                                                image.length,
                                                    (index) => Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  child: Image.network(image[index],
                                                    fit: BoxFit.cover,),
                                                ),
                                              ).toList(),
                                            )
                                          // FadeInImage.assetNetwork(
                                          //   image: list[index]['image'],
                                          //   height: MediaQuery.of(context).size.height * 0.2,
                                          //   width:  MediaQuery.of(context).size.width,
                                          //   placeholder: 'assets/image/loader.gif',
                                          //   imageErrorBuilder: (context, error, stackTrace) {
                                          //     return Center(
                                          //       child: Image.asset('assets/image/loader.gif',
                                          //           height: 50,
                                          //           width: 50,
                                          //           fit: BoxFit.contain),
                                          //     );
                                          //   },
                                          //   fit: BoxFit.cover,
                                          // ),
                                        ),
                                        // Positioned(
                                        //   right: 10,
                                        //   top: 10,
                                        //   child: Container(
                                        //     child: Row(
                                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        //       children: <Widget>[
                                        //         ClipOval(
                                        //           child: Material(
                                        //             color: Colors.white,
                                        //             child:list[index]['isfavorite']=="0" ?
                                        //             GestureDetector(
                                        //               onTap:(){
                                        //                 setState(() {
                                        //                   editFavorite(list[index]['id'], "1");
                                        //                 });
                                        //               },
                                        //               child: SizedBox(
                                        //                 child: Icon(Icons.favorite_border,color: Colors.black),
                                        //                 height: 32,
                                        //                 width: 32,
                                        //               ),
                                        //             ):
                                        //             GestureDetector(
                                        //               onTap:(){
                                        //                 setState(() {
                                        //                   editFavorite(list[index]['id'], "0");
                                        //                 });
                                        //               },
                                        //               child: SizedBox(
                                        //                 child: Icon(Icons.favorite,color: Colors.redAccent),
                                        //                 height: 32,
                                        //                 width: 32,
                                        //               ),
                                        //             ),
                                        //           ),
                                        //         ),
                                        //       ],
                                        //     ),
                                        //   ),
                                        // ),
                                        Column(
                                          children: [
                                            SizedBox(height:screenHeight * .28,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: _buildIndicators(),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:CrossAxisAlignment.start ,
                                      children: [
                                        Text(
                                          // 'AED ${formatter.format(int.parse(list[index]['price']))}',
                                          'AED ${list[index]['price']}',
                                          style: GoogleFonts.cairo(
                                            textStyle: TextStyle(
                                                fontSize: 18,
                                                color:Colors.red[700],
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '${make} . ${model}',
                                          style: GoogleFonts.cairo(
                                            textStyle: TextStyle(
                                                fontSize: 18,
                                                color:Colors.black,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'home_kilo'.tr,
                                              style: GoogleFonts.cairo(
                                                textStyle: TextStyle(
                                                    fontSize: 18,
                                                    color:Colors.black,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 3,),
                                            Text(
                                              //'${formatter.format(int.parse(list[index]['kilometers']))}',
                                              list[index]['kilometers'],
                                              style: GoogleFonts.cairo(
                                                textStyle: TextStyle(
                                                    fontSize: 16,
                                                    color:Colors.black38
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Text('|'),
                                            SizedBox(width: 10,),
                                            Text(
                                              'home_year'.tr,
                                              style: GoogleFonts.cairo(
                                                textStyle: TextStyle(
                                                    fontSize: 18,
                                                    color:Colors.black,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 3,),
                                            Text(
                                              list[index]['year'],
                                              style: GoogleFonts.cairo(
                                                textStyle: TextStyle(
                                                    fontSize: 16,
                                                    color:Colors.black38
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                      : new Center(
                    child: Image.asset('assets/image/loader.gif'),
                  );
                }else{
                  return Container(
                    height: screenHeight -
                        (screenHeight * .08) -
                        appBarHeight -
                        statusBarHeight,
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/image/empty.png',width: 80,height: 80,),
                            Text('home_no_result'.tr,
                              style: GoogleFonts.cairo(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        )
                    ),
                  );
                }
              }catch(e){
                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      //List list = snapshot.data;
                      return Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.white,
                        child: Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              elevation: 8,
                              child:Column(
                                crossAxisAlignment:CrossAxisAlignment.start ,
                                children: <Widget>[
                                  Container(
                                    height: 220.0,
                                    child: Stack(
                                      children: [

                                        Column(
                                          children: [
                                            SizedBox(height:screenHeight * .28,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: _buildIndicators(),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:CrossAxisAlignment.start ,
                                      children: [
                                        Text(
                                          // 'AED ${formatter.format(int.parse(list[index]['price']))}',
                                          'dsdssd',
                                          style: GoogleFonts.cairo(
                                            textStyle: TextStyle(
                                                fontSize: 18,
                                                color:Colors.red[700],
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '${make} . ${model}',
                                          style: GoogleFonts.cairo(
                                            textStyle: TextStyle(
                                                fontSize: 18,
                                                color:Colors.black,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'home_kilo'.tr,
                                              style: GoogleFonts.cairo(
                                                textStyle: TextStyle(
                                                    fontSize: 18,
                                                    color:Colors.black,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 3,),
                                            Text(
                                              //'${formatter.format(int.parse(list[index]['kilometers']))}',
                                              'skslaska',
                                              style: GoogleFonts.cairo(
                                                textStyle: TextStyle(
                                                    fontSize: 16,
                                                    color:Colors.black38
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10,),
                                            Text('|'),
                                            SizedBox(width: 10,),
                                            Text(
                                              'home_year'.tr,
                                              style: GoogleFonts.cairo(
                                                textStyle: TextStyle(
                                                    fontSize: 18,
                                                    color:Colors.black,
                                                    fontWeight: FontWeight.bold
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 3,),
                                            Text(
                                              'jsldjsljd',
                                              style: GoogleFonts.cairo(
                                                textStyle: TextStyle(
                                                    fontSize: 16,
                                                    color:Colors.black38
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
