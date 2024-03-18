import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:project_1/constants/string.dart';
import 'package:project_1/model/inspectionModel.dart';

class InspectionlistController extends GetxController {
  var box = GetStorage();

  @override
  void onInit() {
    getInspections();
    super.onInit();
  }

  var datalist = <Datum>[].obs;
  var isLoading = true.obs;

  Future<void> getInspections() async {
    var headers = {
      'Authorization': 'Bearer ${box.read("token")}',
      'Accept': 'application/json'
    };
    const String userUrl = "${url}get-inspections";
    final response = await http.get(Uri.parse(userUrl), headers: headers);
    try {
      if (response.statusCode == 200) {
        var data = inspectionlistFromJson(response.body);
        datalist.value = data.data!;
        isLoading.value = false;
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
