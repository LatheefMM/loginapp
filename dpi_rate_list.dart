import 'package:nexteons_study_project/model/dip_rate_data_model/list.dart';

class DpiRateList {
  List<DipListElement>? list;
  int? totalCount;

  DpiRateList({
    this.list,
    this.totalCount,
  });

  factory DpiRateList.fromJson(Map<String, dynamic> json) => DpiRateList(
        list: json["list"] == null
            ? []
            : List<DipListElement>.from(
                json["list"]!.map((x) => DipListElement.fromJson(x))),
        totalCount: json["totalCount"],
      );

  Map<String, dynamic> toJson() => {
        "list": list == null
            ? []
            : List<dynamic>.from(list!.map((x) => x.toJson())),
        "totalCount": totalCount,
      };
}
