import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;

import 'models/mymodel.dart';

class ControllerClass extends GetxController{
  RxList items=[].obs;
  RxList ?data;
  RxBool islodaing=true.obs;

  Future addData(String title) {
    return http.post(
      Uri.parse('https://flutter-test.staging-projects.iotreeminds.com/:username/api/items'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "username": ":username",
        "item": title.toString(),
        "_id": "666ac2e214735f0b226a3105",
        "__v": "0"
      }),
    );
  }
  Future<MyitemModel> fetchData() async {
    print('hell1');
    final response = await http
        .get(Uri.parse('https://flutter-test.staging-projects.iotreeminds.com/:username/api/items'));

    if (response.statusCode == 200) {

      islodaing.value=false;
     data?.value= MyitemModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>) as List
      return MyitemModel.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      print('hell3');
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  void updateData(String title) {
    http.put(
      Uri.parse('https://flutter-test.staging-projects.iotreeminds.com/:username/api/items/6669ccbe14735f0b226a30e6'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );

  }

 void deleteAlbum(String items) async {
    final http.Response response = await http.delete(
      Uri.parse('https://flutter-test.staging-projects.iotreeminds.com/:username/api/${items}/6669ccbe14735f0b226a30e6'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if(response.statusCode==200){
fetchData();

    };
  }

}