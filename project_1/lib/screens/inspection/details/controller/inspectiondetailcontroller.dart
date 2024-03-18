import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:project_1/constants/string.dart';
import 'package:project_1/screens/inspection/details/view/inspectionDetail.dart';
import 'package:http/http.dart' as http;

class InspectionDetailController extends GetxController {
  var box = GetStorage();
  var datalist;
  var isLoading = true.obs;

  Future<void> getByIdInspection(String id) async {
    var headers = {
      'Authorization': 'Bearer ${box.read("token")}',
      'Accept': 'application/json'
    };
    String userUrl = "${url}get-inspection/$id";
    final response = await http.get(Uri.parse(userUrl), headers: headers);
    try {
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        datalist = data['data'];
        isLoading.value = false;
        Get.to(const InspectionDetail());
        update();
      } else {
        Get.snackbar('Error Loading data!',
            'Sever responded: ${response.statusCode}:${response.reasonPhrase.toString()}');
      }
    } catch (e) {
      print(e);
    }
  }
}
