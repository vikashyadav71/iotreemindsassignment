import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iotreemindsassignment/mycontrolller.dart';
import 'package:http/http.dart' as http;

import 'models/mymodel.dart';

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
final fcontroller=Get.put(ControllerClass());
late Future<MyitemModel> futureData;
final  _mycontroller = TextEditingController();
  showAlertDialog(BuildContext context) {

    // set up the buttons
    Widget cancelButton = TextButton(
      child: InkWell(
        onTap: (){
fcontroller.addData(_mycontroller.text);
Get.back();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Color(0XFF000000),
              borderRadius: BorderRadius.all(Radius.circular(16)),
              border: Border.all(color: Color(0XFF000000),
              )),
          child: Text("Save",style: TextStyle(fontWeight: FontWeight.w400,
              color: Colors.white)),
        ),
      ),
      onPressed:  () {},
    );
    Widget continueButton = TextButton(
      child:InkWell(
        onTap: (){Get.back();},
        child: Container(

          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
        color: Color(0XFFF5F5F5),
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Text("Back",style: TextStyle(fontWeight: FontWeight.w400,
            color: Colors.black
              )),
        ),
      ),
      onPressed:  () {},
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Add Items",style: TextStyle(fontWeight: FontWeight.w700,
          color: Colors.black),),
      content: TextField(
        controller: _mycontroller,
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
@override
  void initState() {
    // TODO: implement initState
  futureData=fcontroller.fetchData();

  super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init:ControllerClass(),
        builder: (value){

     return Scaffold(
        floatingActionButton: FloatingActionButton(mini: false,
          onPressed: () {

            showAlertDialog(context);
          },
          child: Text('Add',style: TextStyle(
              color: Colors.white),),

          backgroundColor: Colors.black,
        ),
        appBar: AppBar(title:Text('My Items',style:TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.w700),),centerTitle: false),
        body:fcontroller.islodaing.value?Center(child: CircularProgressIndicator()):FutureBuilder<MyitemModel>(


            future:fcontroller.fetchData() ,
          builder: (

              BuildContext context, AsyncSnapshot<MyitemModel> snapshot) {
              return  ;

          },
      ));

    });
  }
}
