import 'package:get/get.dart';
import 'package:nexteons_study_project/model/mainFrameButton/main_frame_button_model.dart';

import '../../utils/router_names.dart';

class MainFrameController extends GetxController {
  RxList<FrameButtonData> buttonData = [
    FrameButtonData("Students Data", Routernames.showDatas),
    FrameButtonData("Add Student", Routernames.addDatas),
    FrameButtonData("Dpi List", Routernames.dpilist),
  ].obs;
}
