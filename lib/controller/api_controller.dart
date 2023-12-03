import 'dart:convert';

import 'package:get/get.dart';

import '../models/video_model.dart';
import '../repository/api_repo.dart';

class ApiController extends GetxController {
  final ApiRepo apiRepo;
  ApiController({required this.apiRepo});

  Future<VideoModel> getVideosData({bool isRefresh = false}) async {
    const uri = "https://test-ximit.mahfil.net/api/trending-video/1?page=1";

    final response = await apiRepo.getData(uri);

    var data = json.decode(response.body.toString());

    if (response.statusCode == 200) {
      print(data);
      update();
      return VideoModel.fromJson(data);
    } else {
      return VideoModel.fromJson(data);
    }
  }
}
