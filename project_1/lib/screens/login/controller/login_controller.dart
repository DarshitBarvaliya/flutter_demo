import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:project_1/constants/string.dart';
import 'package:project_1/screens/home/view/home_view.dart';

class LoginController extends GetxController {
  final loginController = TextEditingController();
  final passwordController = TextEditingController();
  final box = GetStorage();

  Future<void> userLogin() async {
    var request = http.MultipartRequest('POST', Uri.parse('https://vebbuilders.com/testapi/api/v1/login'));
    request.fields.addAll({
      'email': loginController.text,
      'password': passwordController.text
    });


    http.StreamedResponse response = await request.send();
    try {
      if (response.statusCode == 200) {
        final resposeData = await response.stream.bytesToString();
        final data = jsonDecode(resposeData);
        box.write("token", data['data']['token']);
        Get.to(const HomeView());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }
}
