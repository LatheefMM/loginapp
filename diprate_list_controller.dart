import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nexteons_study_project/model/dip_rate_data_model/list.dart';
import 'package:nexteons_study_project/model/dip_rate_data_model/sample_datas.dart';
import 'package:nexteons_study_project/repository/diprate/get_dip_rate_api.dart';
import 'package:nexteons_study_project/screen/widget/app_snackbar.dart';
import 'package:nexteons_study_project/utils/constant/app_const.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/constant/storage_keys.dart';

class DipRateListController extends GetxController {
  late SharedPreferences sharedPreferences;

  var nameControl = TextEditingController();
  var rateControl = TextEditingController();

  var dpilist = <DipListElement>[].obs;
  RxBool isLoading = false.obs;

  Future<void> getData() async {
    isLoading = true.obs;
    Map<String, String> headers = await getApiheader();
    if (headers.isEmpty) {
      var message = "Failed to get API headers";
      log(message);
      return;
    }

    Map<String, dynamic> payload = {
      'query': '''
        query List(\$filterOptions: ListDpiInput!) {
          DpiRate_List(FilterOptions: \$filterOptions) {
            list {
              _name
              _rate
              _id
            }
            totalCount
          }
        }
      ''',
      'variables': {
        "filterOptions": {
          "branchIds": "6631da5ce9efa0bd84a86852",
          "limit": -1,
          "skip": 0,
          "statusArray": [1]
        }
      }
    };

    try {
      var responsebody =
          await GetDipRate.fetchData(header: headers, data: payload);
      if (responsebody["data"] != null) {
        SampleDipRateModel sampleDipRateModel =
            SampleDipRateModel.fromJson(responsebody);

        // Updating dpilist with new datas fetched
        dpilist.value = sampleDipRateModel.data?.dpiRateList?.list ?? [];
        isLoading = false.obs;

        AppSnackbar.oneTimeSnackBar("Success",
            context: navigatorKey.currentContext!, bgColor: Colors.green);
      } else {
        AppSnackbar.oneTimeSnackBar("Failed to Fetch Data",
            context: navigatorKey.currentContext!, bgColor: Colors.red);
      }
    } catch (e) {
      log("An error occurred: $e");
    }
  }

  Future<Map<String, String>> getApiheader() async {
    sharedPreferences = await SharedPreferences.getInstance();
    String? accessToken = sharedPreferences.getString(StorageKeys.accessToken);
    if (accessToken != null) {
      return {"X-Tenant-Id": "RL0582", "Authorization": "Bearer $accessToken"};
    } else {
      log("accesstoken is null");
      return {};
    }
  }

//adding data to dpi api
  void addData() async {
    Map<String, String> headers = await getApiheader();
    if (headers.isEmpty) {
      var message = "Failed to get API headers";
      log(message);
      return;
    }

    Map<String, dynamic> payload = {
      'query': '''
mutation DPI_Rate_Create(\$createDpiRateInput: CreateDpiRateInput!) {
  DPI_Rate_Create(createDpiRateInput: \$createDpiRateInput) {
    _id
  }
}
''',
      'variables': {
        "createDpiRateInput": {
          "_branchId": '6631da5ce9efa0bd84a86852',
          "_name": nameControl.text,
          "_rate": int.parse(rateControl.text)
        }
      },
    };

    try {
      var responsebody =
          await GetDipRate.fetchData(header: headers, data: payload);
      if (responsebody["data"] != null) {
        AppSnackbar.oneTimeSnackBar("Success",
            context: navigatorKey.currentContext!, bgColor: Colors.green);
        await getData();
      } else {
        AppSnackbar.oneTimeSnackBar("Failed to Fetch Data",
            context: navigatorKey.currentContext!, bgColor: Colors.red);
      }
      nameControl.clear();
      rateControl.clear();
      Navigator.of(navigatorKey.currentContext!).pop();
    } catch (e) {
      log("An error occurred: $e");
    }
  }

  editData({String? id}) async {
    Map<String, String> headers = await getApiheader();
    if (headers.isEmpty) {
      var message = "Failed to get API headers";
      log(message);
      return;
    }

    Map<String, dynamic> payload = {
      'query': '''
mutation DPI_Rate_Update(\$updateDpiRateInput: UpdateDpiRateInput!) {
  DPI_Rate_Update(updateDpiRateInput: \$updateDpiRateInput) {
    _id
  }
}
''',
      'variables': {
        "updateDpiRateInput": {
          "_branchId": "6631da5ce9efa0bd84a86852",
          "_editCount": -1,
          "_id": id,
          "_name": nameControl.text,
          "_rate": int.tryParse(rateControl.text)
        }
      },
    };

    try {
      var responsebody =
          await GetDipRate.fetchData(header: headers, data: payload);
      if (responsebody["data"] != null) {
        AppSnackbar.oneTimeSnackBar("Success",
            context: navigatorKey.currentContext!, bgColor: Colors.green);
        await getData();
        nameControl.clear();
        rateControl.clear();
      } else {
        AppSnackbar.oneTimeSnackBar("Failed to Fetch Data",
            context: navigatorKey.currentContext!, bgColor: Colors.red);
      }
      nameControl.clear();
      rateControl.clear();
      Navigator.of(navigatorKey.currentContext!).pop();
    } catch (e) {
      log("An error occurred: $e");
    }
  }

  void delete({String? id}) async {
    isLoading = true.obs;
    Map<String, String> headers = await getApiheader();
    if (headers.isEmpty) {
      var message = "Failed to get API headers";
      log(message);
      return;
    }

    Map<String, dynamic> payload = {
      'query': '''
mutation DPI_Rate_StatusChange(\$statusChange: StatusChangeInput!) {
  DPI_Rate_StatusChange(statusChange: \$statusChange) {
    message
}
}
''',
      'variables': {
        "statusChange": {
          "_editCount": -1,
          "_logDescription": null,
          "_status": "DELETE",
          "ids": id
        }
      }
    };

    try {
      var responsebody =
          await GetDipRate.fetchData(header: headers, data: payload);
      if (responsebody["data"] != null) {
        await getData();
      } else {
        AppSnackbar.oneTimeSnackBar("Failed to Fetch Data",
            context: navigatorKey.currentContext!, bgColor: Colors.red);
      }
      isLoading = false.obs;
    } catch (e) {
      log("An error occurred: $e");
    }
  }
}
