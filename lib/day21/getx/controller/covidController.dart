import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:dailywork/day21/getx/model/covidModel.dart';

class CovidController extends GetxController {
  var baseUrl = "https://api.rootnet.in/covid19-in/stats/latest";
  var isLoading = false.obs;
  RxList<Regional> regionalList = RxList<Regional>();

  @override
  void onInit() {
    super.onInit();
    getApi();
  }

  void getApi() async {
    try {
      isLoading.value = true;
      var response = await http.get(Uri.parse(baseUrl));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data']['regional'];
        regionalList.addAll(
            data.map<Regional>((json) => Regional.fromJson(json)).toList());
      } else {
        print("❌ API call failed with status: ${response.statusCode} ❌");
      }
    } catch (e) {
      print("❌ Error: $e ❌");
    } finally {
      isLoading.value = false;
    }
  }
}
