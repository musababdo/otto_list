
import 'dart:convert';
import 'dart:io';
import "package:async/async.dart";
import 'package:otto_list/constants.dart';
import 'package:otto_list/screens/car/car_add/two.dart';
import 'package:otto_list/screens/car/display.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AddThree extends StatefulWidget {

  @override
  State<AddThree> createState() => _AddThreeState();
}

class _AddThreeState extends State<AddThree> {

  DateTime currentdate=new DateTime.now();
  String? formatdate;

  final ImagePicker picker = ImagePicker();
  List<File> imageList = [];
  File? _image;
  XFile? image;
  void openGallery()async{
    //image = await picker.pickImage(source: ImageSource.camera);
    List<XFile> images = await picker.pickMultiImage();
    //final File file_gallery = File(image!.path);
    setState(() {
      //_image=file_gallery;
      imageList.addAll(images.map((xfile) => File(xfile.path)));
    });
  }

  TextEditingController extra_ar = new TextEditingController();
  TextEditingController extra_en = new TextEditingController();

  String? u_id,city_ar,city_en,make,model,trim,regional_ar,regional_en,fuel_ar,fuel_en,body_cond_ar,body_cond_en;
  String? mech_cond_ar,mech_cond_en,year,kilo,price,phone,exterior_ar,exterior_en;
  String? interor_ar,interior_en,doors_ar,doors_en,no_of_ar,no_of_en,trans_ar,trans_en;
  String? body_type_ar,body_type_en,horse_ar,horse_en,sterring_ar,sterring_en;

  Future save() async{
      final uri = Uri.parse('http://10.0.2.2/otto_list/car_add.php');
      List<String> base64Images = [];
      for (File imageFile in imageList) {
        List<int> imageBytes = await imageFile.readAsBytesSync();
        String base64Image = base64Encode(imageBytes);
        base64Images.add(base64Image);
      }
      String jsonImages = jsonEncode(base64Images);
      final response = await http.post(
        uri,
        body: {
          'u_id' : u_id,
          'city_ar' : city_ar,
          'city_en': city_en,
          'make' : make,
          'model': model,
          'trim' : trim,
          'regional_specs_ar' : regional_ar,
          'regional_specs_en': regional_en,
          'fuel_type_ar' : fuel_ar,
          'fuel_type_en' : fuel_en,
          'body_condition_ar' : body_cond_ar,
          'body_condition_en' : body_cond_en,
          'mech_condition_ar' : mech_cond_ar,
          'mech_condition_en' : mech_cond_en,
          'year' : year,
          'kilometers' : kilo,
          'price' : price,
          'number' : phone,
          'exterior_color_ar' : exterior_ar,
          'exterior_color_en' : exterior_en,
          'interior_color_ar' : interor_ar,
          'interior_color_en' : interior_en,
          'doors_ar' : doors_ar,
          'doors_en' : doors_en,
          'no_of_cylinder_ar' : no_of_ar,
          'no_of_cylinder_en' : no_of_en,
          'transmission_type_ar' : trans_ar,
          'transmission_type_en' : trans_en,
          'body_type_ar' : body_type_ar,
          'body_type_en' : body_type_en,
          'horsepower_ar' : horse_ar,
          'horsepower_en' : horse_en,
          'steering_side_ar' : sterring_ar,
          'steering_side_en' : sterring_en,
          'extras_ar' : extra_ar.text,
          'extras_en' : extra_en.text,
          'images' : jsonImages,
          'date' : formatdate,
        },
      );

      if (response.statusCode == 200) {
        print('Images saved successfully');
      } else {
        print('Failed to save images');
      }
  }

  // Future upload() async {
  //   //url of local database
  //   final uri = Uri.parse("http://10.0.2.2/otto_list/car_add.php");
  //   //http request to post data
  //   var request = new http.MultipartRequest("POST", uri);
  //   //request.fields['name']=title
  //   var pic = await http.MultipartFile.fromPath("image", _image!.path);
  //   request.files.add(pic);
  //   request.fields['make'] = make!;
  //   request.fields['model'] = model!;
  //   request.fields['trim'] = trim!;
  //   request.fields['regional_specs_ar'] = regional_ar!;
  //   request.fields['regional_specs_en'] = regional_en!;
  //   request.fields['fuel_type_ar'] = fuel_ar!;
  //   request.fields['fuel_type_en'] = fuel_en!;
  //   request.fields['body_condition_ar'] = body_cond_ar!;
  //   request.fields['body_condition_en'] = body_cond_en!;
  //   request.fields['mech_condition_ar'] = mech_cond_ar!;
  //   request.fields['mech_condition_en'] = mech_cond_en!;
  //   request.fields['kilometers'] = kilo!;
  //   request.fields['price'] = price!;
  //   request.fields['number'] = phone!;
  //   request.fields['exterior_color_ar'] = exterior_ar!;
  //   request.fields['exterior_color_en'] = exterior_en!;
  //   request.fields['interior_color_ar'] = interor_ar!;
  //   request.fields['interior_color_en'] = interior_en!;
  //   request.fields['doors_ar'] = doors_ar!;
  //   request.fields['doors_en'] = doors_en!;
  //   request.fields['no_of_cylinder_ar'] = no_of_ar!;
  //   request.fields['no_of_cylinder_en'] = no_of_en!;
  //   request.fields['transmission_type_ar'] = trans_ar!;
  //   request.fields['transmission_type_en'] = trans_en!;
  //   request.fields['body_type_ar'] = body_type_ar!;
  //   request.fields['body_type_en'] = body_type_en!;
  //   request.fields['horsepower_ar'] = horse_ar!;
  //   request.fields['horsepower_en'] = horse_en!;
  //   request.fields['steering_side_ar'] = sterring_ar!;
  //   request.fields['steering_side_en'] = sterring_en!;
  //   var response = await request.send();
  //   if (response.statusCode == 200) {
  //     print("Image uploaded");
  //   } else {
  //     print("Upload failed");
  //   }
  // }

  Future uploadImage() async {
    List<int> imageBytes = _image!.readAsBytesSync();
    String baseimage = base64Encode(imageBytes);
    var url = Uri.parse('http://10.0.2.2/otto_list/car_add.php');
    var response=await http.post(url, body: {
      'u_id' : u_id,
      'make' : make,
      'model': model,
      'trim' : trim,
      'regional_specs_ar' : regional_ar,
      'regional_specs_en': regional_en,
      'fuel_type_ar' : fuel_ar,
      'fuel_type_en' : fuel_en,
      'body_condition_ar' : body_cond_ar,
      'body_condition_en' : body_cond_en,
      'mech_condition_ar' : mech_cond_ar,
      'mech_condition_en' : mech_cond_en,
      'year' : year,
      'kilometers' : kilo,
      'price' : price,
      'number' : phone,
      'exterior_color_ar' : exterior_ar,
      'exterior_color_en' : exterior_en,
      'interior_color_ar' : interor_ar,
      'interior_color_en' : interior_en,
      'doors_ar' : doors_ar,
      'doors_en' : doors_en,
      'no_of_cylinder_ar' : no_of_ar,
      'no_of_cylinder_en' : no_of_en,
      'transmission_type_ar' : trans_ar,
      'transmission_type_en' : trans_en,
      'body_type_ar' : body_type_ar,
      'body_type_en' : body_type_en,
      'horsepower_ar' : horse_ar,
      'horsepower_en' : horse_en,
      'steering_side_ar' : sterring_ar,
      'steering_side_en' : sterring_en,
      'extras_ar' : extra_ar.text,
      'extras_en' : extra_en.text,
      'image' : baseimage,
      'date' : formatdate,
    });
    //json.decode(response.body);
    if(response.body.isNotEmpty) {
      json.decode(response.body);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    u_id = box.read('u_id');
    city_ar = box.read('city_ar');
    city_en = box.read('city_en');
    make = box.read('make');
    model = box.read('model');
    trim = box.read('trim');
    regional_ar = box.read('regional_ar');
    regional_en = box.read('regional_en');
    fuel_ar = box.read('fuel_ar');
    fuel_en = box.read('fuel_en',);
    body_cond_ar = box.read('body_cond_ar');
    body_cond_en = box.read('body_cond_en',);
    mech_cond_ar = box.read('mech_cond_ar');
    mech_cond_en = box.read('mech_cond_en');
    year = box.read('year');
    kilo = box.read('kilo');
    price = box.read('price');
    phone = box.read('number');

    exterior_ar = box.read('exterior_ar');
    exterior_en = box.read('exterior_en');
    interor_ar = box.read('interior_ar');
    interior_en = box.read('interior_en');
    doors_ar = box.read('doors_ar');
    doors_en = box.read('doors_en');
    no_of_ar = box.read('no_of_ar');
    no_of_en = box.read('no_of_en');
    trans_ar = box.read('trans_ar');
    trans_en = box.read('trans_en');
    body_type_ar = box.read('body_type_ar');
    body_type_en = box.read('body_type_en');
    horse_ar = box.read('horse_ar');
    horse_en = box.read('horse_en');
    sterring_ar = box.read('sterring_ar');
    sterring_en = box.read('sterring_en');
  }

  @override
  Widget build(BuildContext context) {
    formatdate=new DateFormat('dd-MM-yyyy hh:mm:ss aaa').format(currentdate);
    return SafeArea(
      child: WillPopScope(
        onWillPop:(){
          Get.to(AddTwo());
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
                    if(imageList.isEmpty){
                      Fluttertoast.showToast(
                          msg: "choose_image".tr,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                    }else{
                      //uploadImage();
                      save();
                      Fluttertoast.showToast(
                          msg: "save_successfully".tr,
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0
                      );
                      Get.to(CarDisplay());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kMainColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,bottom: 5,top: 5),
                    child: Center(
                        child:Text(
                          "save".tr,
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
          body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Column(
              children: [
                // SizedBox(
                //   height: 20,
                // ),
                TextFormField(
                  maxLines: 3,
                  controller: extra_ar,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.blue),
                      hintText: "addition_arabic".tr
                  ),
                ),
                SizedBox(height: 5,),
                TextFormField(
                  maxLines: 3,
                  controller: extra_en,
                  decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.blue),
                      hintText: "addition_english".tr
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 15,right: 15,bottom: 8,top: 8),
                  child: Builder(
                    builder: (context) => ElevatedButton(
                      onPressed: () {
                        openGallery();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kMainColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20,right: 20,bottom: 5,top: 5),
                        child: Center(
                            child:Text(
                              "choose_image".tr,
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
                SizedBox(height: 10,),
                // _image == null?
                // Container():
                // Container(
                //     height: 120.0,
                //     width: 190.0,
                //     child:Image.file(_image!)
                // ),

                Expanded(
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                      itemCount: imageList.length,
                      itemBuilder: (BuildContext context, int index){
                        return Padding(
                          padding: EdgeInsets.all(2),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Image.file(
                                imageList[index],
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                right: -4,
                                top: -4,
                                child: Container(
                                  color: Colors.white,
                                  child: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        imageList.removeAt(index);
                                      });
                                    },
                                    icon: Icon(Icons.delete),
                                    color: Colors.black,
                                  )
                                ),
                              ),
                            ],
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
