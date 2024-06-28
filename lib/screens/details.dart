
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:otto_list/constants.dart';
import 'package:otto_list/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Details extends StatefulWidget {
  final List list;
  final int index;
  Details({required this.list,required this.index});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  final formatter = new NumberFormat("###,###");

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

  String? make,model,trim,regional,fuel,body_cond;
  String? mech_cond,year,kilo,price,phone,exterior;
  String? interor,doors,no_of,trans;
  String? body_type,horse,sterring,extra,isfavorite,date;
  var image=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    make = box.read('make');
    model = box.read('model');
    trim = widget.list[widget.index]['trim'];
    regional = widget.list[widget.index]['regional_specs'];
    fuel = widget.list[widget.index]['fuel_type'];
    body_cond = widget.list[widget.index]['body_condition'];
    mech_cond = widget.list[widget.index]['mech_condition'];
    year = widget.list[widget.index]['year'];
    kilo = widget.list[widget.index]['kilometers'];
    price = widget.list[widget.index]['price'];
    phone = widget.list[widget.index]['number'];
    exterior = widget.list[widget.index]['exterior_color'];
    interor = widget.list[widget.index]['interior_color'];
    doors = widget.list[widget.index]['doors'];
    no_of = widget.list[widget.index]['no_of_cylinder'];
    trans = widget.list[widget.index]['transmission_type'];
    body_type = widget.list[widget.index]['body_type'];
    horse = widget.list[widget.index]['horsepower'];
    sterring = widget.list[widget.index]['steering_side'];
    extra = widget.list[widget.index]['extras'];
    image = jsonDecode(widget.list[widget.index]['image']);
    mylength = jsonDecode(widget.list[widget.index]['image']);
    isfavorite = widget.list[widget.index]['isfavorite'];
    date = widget.list[widget.index]['date'];
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: WillPopScope(
        onWillPop:(){
          Get.to(Home());
          return Future.value(false);
        },
        child: Scaffold(
          persistentFooterButtons: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,bottom: 8,top: 8),
              child: Builder(
                builder: (context) => ElevatedButton(
                  onPressed: () {
                    launch('tel://${phone}');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kMainColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,bottom: 5,top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.call),
                        SizedBox(width: 7,),
                        Text(
                          "details_call".tr,
                          style: GoogleFonts.cairo(
                            textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 120,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ClipOval(
                      child: Material(
                        color: Colors.white,
                        child:GestureDetector(
                          onTap: (){
                            Get.to(Home());
                          },
                          child: SizedBox(
                            child: Icon(Icons.arrow_back,color: Colors.black),
                            height: 32,
                            width: 32,
                          ),
                        )
                      ),
                    ),
                    // ClipOval(
                    //   child: Material(
                    //     color: Colors.white,
                    //     child:isfavorite=="0" ?
                    //     SizedBox(
                    //       child: Icon(Icons.favorite_border,color: Colors.black),
                    //       height: 32,
                    //       width: 32,
                    //     ):
                    //     SizedBox(
                    //       child: Icon(Icons.favorite,color: Colors.redAccent),
                    //       height: 32,
                    //       width: 32,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(20),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)
                          ),
                          color: Colors.white,
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment:CrossAxisAlignment.start ,
                            children: [
                              Text(
                                'AED ${formatter.format(int.parse(price!))}',
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                pinned: true,
                backgroundColor: Colors.white,
                expandedHeight: 400,
                flexibleSpace: FlexibleSpaceBar(
                  //background: Image.network(image!,width: double.maxFinite,fit: BoxFit.cover,),
                  background:Stack(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: MediaQuery.of(context).size.height,
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
                      ),
                      Column(
                        children: [
                          SizedBox(height:screenHeight * .38,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: _buildIndicators(),
                          ),
                        ],
                      )
                    ],
                  )
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 20,
                      color: Color(0xFFCDCBCE),
                    ),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(right: 10,left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'details_details'.tr,
                            style: GoogleFonts.cairo(
                              textStyle: TextStyle(
                                  fontSize: 25,
                                  color:Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'details_trim'.tr,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                trim!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'details_year'.tr,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                year!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'details_kilo'.tr,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                kilo!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'details_regional'.tr,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                regional!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'details_exterior'.tr,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                exterior!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'details_doors'.tr,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                doors!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'details_body_cond'.tr,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                body_cond!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'details_mecha_cond'.tr,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                mech_cond!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'details_interior'.tr,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                interor!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'details_horse'.tr,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                horse!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'details_body_type'.tr,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                body_type!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'details_no_of'.tr,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                no_of!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'details_trans'.tr,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                trans!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'details_fuel_type'.tr,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                fuel!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'details_steering'.tr,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                sterring!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'details_posted'.tr,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 20,
                                      color:Colors.black,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                              Text(
                                date!,
                                style: GoogleFonts.cairo(
                                  textStyle: TextStyle(
                                      fontSize: 18,
                                      color:Colors.black38,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Divider(),
                          Visibility(
                            visible: extra!.isEmpty?false:true,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'details_extras'.tr,
                                      style: GoogleFonts.cairo(
                                        textStyle: TextStyle(
                                            fontSize: 20,
                                            color:Colors.black,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                    Text(
                                      extra!,
                                      style: GoogleFonts.cairo(
                                        textStyle: TextStyle(
                                            fontSize: 18,
                                            color:Colors.black38,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
