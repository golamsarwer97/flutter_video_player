import 'package:flutter_video_player/controller/api_controller.dart';
import 'package:get/get.dart';

import '../repository/api_repo.dart';

Future<void> initDep() async {
  //Repository
  Get.lazyPut(() => ApiRepo(), fenix: true);

  //Controller
  Get.lazyPut(
    () => ApiController(apiRepo: Get.find()),
    fenix: true,
  );
}
