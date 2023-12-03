import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/video_model.dart';

class ApiRepo extends GetxController {
  // final _baseUrl = 'https://test-ximit.mahfil.net/api/trending-video/1';

  Future<http.Response> getData(String uri) async {
    try {
      final responseData = await http.get(Uri.parse(uri));
      return responseData;
    } on Exception catch (e) {
      return http.Response(e.toString(), 1);
    }
  }
}
