
import 'dart:convert';

import 'package:otto_list/constants.dart';
import 'package:otto_list/screens/car/car_add/one.dart';
import 'package:otto_list/screens/car/car_edit/one.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:otto_list/screens/home.dart';

class CarDisplay extends StatefulWidget {

  @override
  State<CarDisplay> createState() => _CarDisplayState();
}

class _CarDisplayState extends State<CarDisplay> {

  String? u_id;
  Future Display() async{
    var url = Uri.parse('http://10.0.2.2/otto_list/car_read_with_id.php');
    var response=await http.post(url, body: {
      "u_id" : u_id,
    });
    return json.decode(response.body);
  }

  Stream display() async* {
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      yield await Display();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    u_id = box.read('u_id');
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
          Get.to(Home());
          return Future.value(false);
        },
        child: Scaffold(
          floatingActionButton: new FloatingActionButton(
            onPressed:(){
              Get.to(AddOne());
            } ,
            child: new Icon(Icons.add,color: Colors.white,),
            backgroundColor: kMainColor,
          ),
          appBar: AppBar(
            backgroundColor: kMainColor,
            centerTitle: true,
            title: Text(
              'mycars'.tr,
              style: GoogleFonts.cairo(
                textStyle: TextStyle(
                    color: Colors.white
                ),
              ),
            ),
          ),
          body: StreamBuilder(
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
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: screenHeight * .18,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)
                              ),
                              elevation: 1,
                              child:Padding(
                                padding: const EdgeInsets.only(right: 20,left: 20),
                                child: Row(
                                  mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                                  children: <Widget>[
                                    // ClipRRect(
                                    //   borderRadius: new BorderRadius.only(
                                    //     topLeft: const Radius.circular(18),
                                    //     bottomLeft: const Radius.circular(18),
                                    //   ),
                                    //   child: FadeInImage.assetNetwork(
                                    //     image: list[index]['image'],
                                    //     placeholder: 'assets/image/loader.gif',
                                    //     width: MediaQuery.of(context).size.width / 3,
                                    //     height: MediaQuery.of(context).size.height,
                                    //     imageErrorBuilder: (context, error, stackTrace) {
                                    //       return Image.asset('assets/image/loader.gif',
                                    //           width: MediaQuery.of(context).size.width / 3,
                                    //           fit: BoxFit.cover);
                                    //     },
                                    //     fit: BoxFit.cover,
                                    //   ),
                                    // ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('${list[index]['make']}.${list[index]['model']}',
                                          style: GoogleFonts.cairo(
                                            textStyle: TextStyle(
                                                fontSize: 20
                                            ),),),
                                        Text(list[index]['trim'],
                                          style: GoogleFonts.cairo(
                                            textStyle: TextStyle(
                                                fontSize: 20
                                            ),),),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(right:20),
                                              child: GestureDetector(
                                                onTap: () {
                                                  Navigator.push(context, MaterialPageRoute(builder: (context) => EditOne(list: list,index: index,),),);
                                                },
                                                child: Icon(
                                                  Icons.edit,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                showDialog(context: context,
                                                    builder: (context){
                                                      return AlertDialog(
                                                        content: Text('sure_delete'.tr),
                                                        actions: <Widget>[
                                                          ElevatedButton(
                                                              onPressed: (){
                                                                Navigator.of(context).pop();
                                                              },
                                                              child: Text("no".tr)
                                                          ),
                                                          ElevatedButton(
                                                              onPressed: (){
                                                                setState(() {
                                                                  var url = Uri.parse('http://10.0.2.2/otto_list/car_delete.php');
                                                                  http.post(url,body: {
                                                                    'id' : list[index]['id'],
                                                                  });
                                                                  Navigator.of(context).pop();
                                                                });
                                                              },
                                                              child: Text("yes".tr)
                                                          ),
                                                        ],
                                                      );
                                                    }
                                                );
                                              },
                                              child: Icon(
                                                Icons.delete,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    //Padding(padding: const EdgeInsets.only(right:15)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      })
                      : new Center(
                    child: new CircularProgressIndicator(),
                  );
                }else{
                  return Container(
                    height: screenHeight -
                        (screenHeight * .08) -
                        appBarHeight -
                        statusBarHeight,
                    child: Center(
                      child: Text('home_no_result'.tr,
                        style: TextStyle(
                            fontSize: 30
                        ),
                      ),
                    ),
                  );
                }
              }catch(e){
                return new Center(
                  child: new CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
