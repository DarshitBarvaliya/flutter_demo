import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:project_1/constants/string.dart';
import 'package:project_1/model/propertyModel.dart';

class HomeController extends GetxController {
  var propertylist = [];
  var box = GetStorage();

  @override
  void onInit() {
    getProperties();
    super.onInit();
  }

  var datalist = <Datum>[].obs;
  var isLoading = true.obs;

  Future<void> getProperties() async {
    var headers = {
      'Authorization': 'Bearer ${box.read("token")}',
      'Accept': 'application/json'
    };
    const String userUrl = "${url}get-properties";
    final response = await http.get(Uri.parse(userUrl), headers: headers);
    try {
      if (response.statusCode == 200) {
        var data = propertylistFromJson(response.body);
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
