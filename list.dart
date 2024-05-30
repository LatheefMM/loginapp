class DipListElement {
  String? name;
  double? rate;
  String? id;

  DipListElement({
    this.name,
    this.rate,
    this.id,
  });

  factory DipListElement.fromJson(Map<String, dynamic> json) => DipListElement(
        name: json["_name"],
        rate: json["_rate"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "_name": name,
        "_rate": rate,
        "_id": id,
      };
}
