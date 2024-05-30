import 'dpi_rate_list.dart';

class Data {
  DpiRateList? dpiRateList;

  Data({this.dpiRateList});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        dpiRateList: json['DpiRate_List'] == null
            ? null
            : DpiRateList.fromJson(
                json['DpiRate_List'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'DpiRate_List': dpiRateList?.toJson(),
      };
}
