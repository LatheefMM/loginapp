import 'data.dart';

class SampleDipRateModel {
  Data? data;

  SampleDipRateModel({this.data});

  factory SampleDipRateModel.fromJson(Map<String, dynamic> json) => SampleDipRateModel(
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
      };
}
