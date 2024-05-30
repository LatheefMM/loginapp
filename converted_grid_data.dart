import 'package:flutter/material.dart';
import 'package:nexteons_study_project/screen/diprate/list/responsive/widget/dpi_alert_entry.dart';
import 'package:nexteons_study_project/utils/color_theme.dart';
import 'package:nexteons_study_project/utils/constant/app_const.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../diprate_list_controller.dart';

class ConvertedGridData extends DataGridSource {
  List<DataGridRow> datagridrow = [];
  final DipRateListController controller;

  ConvertedGridData(this.controller) {
    datagridrow = controller.dpilist.map<DataGridRow>((listitems) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'id', value: listitems.id),
        DataGridCell<String>(columnName: 'name', value: listitems.name),
        DataGridCell<double>(columnName: 'rate', value: listitems.rate),
        DataGridCell<Widget>(
          columnName: 'edit',
          value: IconButton(
            onPressed: () {
              showDialog(
                context: navigatorKey.currentContext!,
                builder: (context) {
                  return DpiAlertBoxEntryFeild(
                      id: listitems.id,
                      name: listitems.name,
                      rate: listitems.rate.toString(),
                      controller: controller,
                      onpressed: () {
                        controller.editData(id: listitems.id);
                      });
                },
              );
            },
            icon: const Icon(Icons.edit),
          ),
        ),
        DataGridCell<Widget>(
          columnName: 'delete',
          value: IconButton(
            onPressed: () {
              controller.delete(id: listitems.id);
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
      ]);
    }).toList();
  }

  @override
  List<DataGridRow> get rows => datagridrow;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
      color: ColorTheme.grey,
      cells: row.getCells().map<Widget>((datagridcell) {
        if (datagridcell.columnName == "edit" ||
            datagridcell.columnName == "delete") {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            alignment: Alignment.center,
            child: datagridcell.value,
          );
        } else {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            alignment: Alignment.center,
            child: Text(
              datagridcell.value.toString(),
              overflow: TextOverflow.ellipsis,
            ),
          );
        }
      }).toList(),
    );
  }
}
