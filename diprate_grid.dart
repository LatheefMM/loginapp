import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_study_project/utils/color_theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../widget/loading_page.dart';
import '../diprate_list_controller.dart';
import 'widget/converted_grid_data.dart';
import 'widget/dpi_alert_entry.dart';
import 'widget/header_text.dart';

// ignore: must_be_immutable
class DpiDataGrid extends StatelessWidget {
  final DipRateListController controller;
  const DpiDataGrid({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          splashColor: ColorTheme.drkBlue,
          elevation: 50,
          backgroundColor: ColorTheme.lightBlue,
          isExtended: true,
          tooltip: "Add Data",
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => DpiAlertBoxEntryFeild(
                controller: controller,
                onpressed: controller.addData,
              ),
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: Obx(() {
          final convertedTeacherData =
              ConvertedGridData(controller); // used as widget
          return controller.isLoading == true
              ? LoadingPage()
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: SfDataGrid(
                    gridLinesVisibility: GridLinesVisibility.both,
                    headerGridLinesVisibility: GridLinesVisibility.both,
                    allowPullToRefresh: true,
                    source: convertedTeacherData,
                    columns: [
                      GridColumn(
                          columnName: 'id',
                          label:
                              const HeaderContainer(text: 'ID', fontsize: 16)),
                      GridColumn(
                          columnName: 'name',
                          label: const HeaderContainer(
                              text: "Name", fontsize: 16)),
                      GridColumn(
                          columnName: 'rate',
                          label: const HeaderContainer(
                              text: "Rate", fontsize: 16)),
                      GridColumn(
                          columnName: 'edit',
                          label: const HeaderContainer(
                              text: "Edit", fontsize: 16)),
                      GridColumn(
                          columnName: 'delete',
                          label: const HeaderContainer(
                              text: "Delete", fontsize: 16)),
                    ],
                  ),
                );
        }),
      ),
    );
  }
}
