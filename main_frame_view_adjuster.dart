import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_study_project/screen/mainFrame/widget/mobile_drawer.dart';

import '../../utils/check_size.dart';
import 'main_frame_controller.dart';
import 'responsive/desktop_mainframe.dart';
import 'responsive/mobile_mainframe.dart';
import 'responsive/tablet_mainframe.dart';

class FrameAdjuster extends StatefulWidget {
  const FrameAdjuster({super.key, this.child});
  final Widget? child;

  @override
  State<FrameAdjuster> createState() => _FrameAdjusterState();
}

class _FrameAdjusterState extends State<FrameAdjuster> {
  late MainFrameController controller;
  final String tag = DateTime.now().toString();
  @override
  void initState() {
    controller = Get.put(MainFrameController(), tag: tag);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<MainFrameController>(tag: tag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var size = MediaQuery.of(context).size;
        return Scaffold(
            appBar: fnCheckMobile(size.width)
                ? MobileAppBar(
                    controller: controller,
                  )
                : null,
            drawer: fnCheckMobile(size.width)
                ? DrawerRefactored(
                    controller: controller,
                  )
                : null,
            body: Row(
              children: [
                if (fnCheckTablet(size.width) && !fnCheckMobile(size.width))
                  TabletMainFrame(
                    controller: controller,
                  ),
                if (!fnCheckMobile(size.width) && !fnCheckTablet(size.width))
                  DesktopMainFrame(
                    controller: controller,
                  ),
                Expanded(child: widget.child!)
              ],
            ));
      },
    );
  }
}
