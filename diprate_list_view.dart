import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/responsive_layout.dart';
import 'responsive/diprate_grid.dart';
import 'diprate_list_controller.dart';

class DipRateListView extends StatefulWidget {
  const DipRateListView({super.key});

  @override
  State<DipRateListView> createState() => _DipRateListViewState();
}

class _DipRateListViewState extends State<DipRateListView> {
  late DipRateListController controller;
  final String tag = DateTime.now().toString();
  @override
  void initState() {
    controller = Get.put(DipRateListController(), tag: tag);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<DipRateListController>(tag: tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
        mobileBody: DpiDataGrid(controller: controller),
        tabletBody: DpiDataGrid(controller: controller),
        desktopBody: DpiDataGrid(controller: controller));
  }
}
